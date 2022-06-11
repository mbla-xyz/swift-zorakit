import Foundation
import Apollo

public class ZoraAPI {
  public static let shared = ZoraAPI()
  public var endpoint = "https://api.zora.co/graphql"
  public var network = NetworkInput(network: .ethereum, chain: .mainnet)
  private(set) lazy var apollo = ApolloClient(url: URL(string: endpoint)!)
  
  public init() {
    
  }
  
  public func collections() async throws -> [NFTCollection]? {
    return try await withCheckedThrowingContinuation { continuation in
      let query = CollectionsQuery(networks: [network], where: .init(collectionAddresses: []), pagination: .init(limit: 100), sort: .init(sortKey: .created, sortDirection: .asc), includeFullDetails: false)
      
      apollo.fetch(query: query) { result in
        switch result {
          case .success(let collectionData):
            continuation.resume(returning: collectionData.data?.collections.nodes.map { NFTCollection(from: $0)})
          case .failure(let error):
            continuation.resume(throwing: error)
        }
      }
    }
  }
  
  
  public func tokens(query: TokensQueryInput?) async throws -> [NFTToken]? {
    return try await withCheckedThrowingContinuation { continuation in
      let gqlQuery = TokensQuery(networks: [network], where: query, pagination: .init(limit: 100), sort: .init(sortKey: .minted, sortDirection: .asc), includeFullDetails: false, includeSalesHistory: false)
      
      apollo.fetch(query: gqlQuery) { result in
        switch result {
          case .success(let graphQLResult):
            continuation.resume(returning: graphQLResult.data?.tokens.nodes.map { NFTToken(from: $0.token) })
          case .failure(let error):
            continuation.resume(throwing: error)
        }
      }
    }
  }
  
  public func tokens(_ input: NFTTokensInput) async throws -> [NFTToken]? {
    switch input {
      case .collection(let collection):
        return try await tokens(query: .init(collectionAddresses: [collection.address]))
      case .owner(let ownerAddress):
        return try await tokens(query: .init(ownerAddresses: [ownerAddress]))
    }
    // addressses
    // owners
    // token + id
    // filter
    // pagination
    // networks
    // sort
    // include full
    // include sales
  }
  
  public func token(token: String, id: String) async throws -> NFTToken? {
    return try await withCheckedThrowingContinuation { continuation in
      let query = TokenQuery(network: network, token: .init(address: token, tokenId: id), includeFullDetails: false)
      
      apollo.fetch(query: query) { result in
        switch result {
          case .success(let tokenDataResult):
            if let error = tokenDataResult.errors?.first {
              continuation.resume(throwing: error)
            } else if let tokenData = tokenDataResult.data?.token?.token {
              continuation.resume(returning: NFTToken(from: tokenData))
            } else {
              continuation.resume(returning: nil)
            }
          case .failure(let error):
            continuation.resume(throwing: error)
        }
      }
    }
    
    // token address
    // token id
    // network Chain
    // netowrk Network
    // include full
  }
}

public extension ZoraAPI {
  enum NFTTokensInput {
    case owner(String)
    case collection(NFTCollection)
  }
  
  enum APIError: Error {
    case noAddress
  }
}
