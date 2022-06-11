import Foundation
import Apollo

public class ZoraAPI {
  public static let shared = ZoraAPI()
  public var endpoint = "https://api.zora.co/graphql"
  public var network = NetworkInput(network: .ethereum, chain: .mainnet)
  private(set) lazy var apollo = ApolloClient(url: URL(string: endpoint)!)
  
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
  
  public func collections() async throws -> [NFTCollection]? {
    let query = CollectionsQuery(networks: [network], where: .init(collectionAddresses: []), pagination: .init(limit: 100), sort: .init(sortKey: .created, sortDirection: .asc), includeFullDetails: false)
    query.pagination = .init(limit: 200)
    let result = try await perform(query: query)
    return result?.collections.nodes.map { NFTCollection(from: $0) }
  }
  
  
  public func tokens(query: TokensQueryInput?) async throws -> [NFTToken]? {
    let gqlQuery = TokensQuery(networks: [network], where: query, pagination: .init(limit: 100), sort: .init(sortKey: .minted, sortDirection: .asc), includeFullDetails: false, includeSalesHistory: false)
    let result = try await perform(query: gqlQuery)
    return result?.tokens.nodes.map { NFTToken(from: $0.token) }
  }
  
  public func tokens(_ input: NFTTokensInput) async throws -> [NFTToken]? {
    switch input {
      case .collectionAddress(let collectionAddress):
        return try await tokens(query: .init(collectionAddresses: [collectionAddress]))
      case .collection(let collection):
        return try await tokens(query: .init(collectionAddresses: [collection.address]))
      case .owner(let ownerAddress):
        return try await tokens(query: .init(ownerAddresses: [ownerAddress]))
    }
  }
  
  public func token(address: String, id: String) async throws -> NFTToken? {
    let query = TokenQuery(network: network, token: .init(address: address, tokenId: id), includeFullDetails: false)
    let result = try await perform(query: query)
    if let tokenData = result?.token?.token {
      return NFTToken(from: tokenData)
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
  
  enum APIError: Error {
    case noAddress
  }
}
