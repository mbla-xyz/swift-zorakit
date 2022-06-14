import Foundation
import Apollo

// market info1
// expose raw results while we learn

// This is a thought in progress...
// We currently use Apollo, but it is very opinionated about
// how it types query/response structs. Too opinionated, which
// is why we have to translate everything over to a standardized
// thing.
// We've got a few options, including:
// 1. Define a high level protocol and mark all the Apollo things
//    as conforming.
// 2. Just not use apollo, because once we've built out the protocols,
//    it's not that different to just go ahead and build our own queries
//    out and decode it ourselves. Especially since we're already wanting to
//    do a bit of a DSL for nicer query writing with ResultBuilders.
// Leaning towards 2, but for hackathon purposes, we're going to leave it
// alone, not get nerd sniped, and just clean it up early this week.

public class ZoraAPI {
  public static let shared = ZoraAPI()
  public var endpoint = "https://api.zora.co/graphql"
  public var network = NetworkInput(network: .ethereum, chain: .mainnet)
  private(set) lazy var apollo = ApolloClient(url: URL(string: endpoint)!)
  
  // TODO: allow config with network, endpoints, and API key.
  public init() {}
  
  public func perform<Query: GraphQLQuery>(query: Query) async throws -> Query.Data? {
    return try await withCheckedThrowingContinuation { continuation in
      apollo.fetch(query: query) { result in
        switch result {
          case .success(let queryData):
            continuation.resume(returning: queryData.data)
          case .failure(let error):
            continuation.resume(throwing: error)
        }
      }
    }
  }
  
  public func collections(page: PaginationInput = .init(limit: 32)) async throws -> [NFTCollection]? {
    let query = CollectionsQuery(networks: [network], where: .init(collectionAddresses: []), pagination: page, sort: .init(sortKey: .created, sortDirection: .asc), includeFullDetails: false)
    let result = try await perform(query: query)
    return result?.collections.nodes.map { NFTCollection(from: $0) }
  }
  
  
  public func tokens(query: TokensQueryInput?, page: PaginationInput = .init(limit: 10)) async throws -> (PageInfo, [NFT]?) {
    let gqlQuery = TokensQuery(networks: [network], where: query, pagination: page, sort: .init(sortKey: .minted, sortDirection: .asc), includeFullDetails: true, includeSalesHistory: false)
    let result = try await perform(query: gqlQuery)
    let pageInfo = PageInfo(from: result?.tokens.pageInfo)
    return (
      pageInfo,
      result?.tokens.nodes.map { NFT(from: $0.token) }
    )
  }
  
  public func tokens(_ input: NFTTokensInput, page: PaginationInput = .init(limit: 10)) async throws -> (PageInfo, [NFT]?) {
    switch input {
      case .collectionAddress(let collectionAddress):
        return try await tokens(query: .init(collectionAddresses: [collectionAddress]), page: page)
      case .collection(let collection):
        return try await tokens(query: .init(collectionAddresses: [collection.address]), page: page)
      case .owner(let ownerAddress):
        return try await tokens(query: .init(ownerAddresses: [ownerAddress]), page: page)
    }
  }
  
  public func token(address: String, id: String) async throws -> NFT? {
    let query = TokenQuery(network: network, token: .init(address: address, tokenId: id), includeFullDetails: true)
    let result = try await perform(query: query)
    if let tokenData = result?.token?.token {
      return NFT(from: tokenData)
    }
    return nil
  }
}

public extension ZoraAPI {
  enum NFTTokensInput {
    case owner(String)
    case collection(NFTCollection)
    case collectionAddress(String)
  }
}
