import Foundation
import Apollo

public typealias datetime = String
public typealias Date = String

public enum JSONScalar {
  case dictionary([String: Any])
  case array([Any])
}

extension JSONScalar: JSONDecodable {
  public init(jsonValue value: JSONValue) throws {
    if let dict = value as? [String: Any] {
      self = .dictionary(dict)
    } else if let array = value as? [Any] {
      self = .array(array)
    } else {
      throw JSONDecodingError.couldNotConvert(value: value, to: JSONScalar.self)
    }
  }
}

@propertyWrapper
public struct EquatableNoop<Value>: Equatable {
  public var wrappedValue: Value
  
  public init(wrappedValue value: Value) {
    self.wrappedValue = value
  }
  
  public static func == (lhs: EquatableNoop<Value>, rhs: EquatableNoop<Value>) -> Bool {
    true
  }
}

@propertyWrapper
public struct HashableNoop<Value: Equatable>: Hashable {
  public var wrappedValue: Value
  
  public init(wrappedValue value: Value) {
    self.wrappedValue = value
  }
  
  public func hash(into hasher: inout Hasher) {}
}

@propertyWrapper
public struct CodableNoop<Value> {
  public var wrappedValue: Value?
  
  public init(wrappedValue: Value?) {
    self.wrappedValue = wrappedValue
  }
  
}
extension CodableNoop: Codable {
  public func encode(to encoder: Encoder) throws {
    // Skip encoding the wrapped value.
  }
  public init(from decoder: Decoder) throws {
    // The wrapped value is simply initialised to nil when decoded.
    self.wrappedValue = nil
  }
}

// pagination
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
public protocol Query {
  associatedtype Response: Decodable
  var body: String { get }
  static func decodeResponse(_ data: Data) throws -> Response
}

public extension Query {
  static func decodeResponse(_ data: Data) throws -> Response {
    try JSONDecoder().decode(Response.self, from: data)
  }
}

public class ZoraBaseAPI {
  public static let shared = ZoraAPI()
  public var endpoint = "https://api.zora.co/graphql"
  
  public init() {}
}


// This is the actual, in use API right now.

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
    let query = CollectionsQuery(networks: [network], where: .init(collectionAddresses: []), pagination: .init(limit: 32), sort: .init(sortKey: .created, sortDirection: .asc), includeFullDetails: false)
    query.pagination = .init(limit: 200)
    let result = try await perform(query: query)
    return result?.collections.nodes.map { NFTCollection(from: $0) }
  }
  
  
  public func tokens(query: TokensQueryInput?) async throws -> [NFT]? {
    let gqlQuery = TokensQuery(networks: [network], where: query, pagination: .init(limit: 32), sort: .init(sortKey: .minted, sortDirection: .asc), includeFullDetails: true, includeSalesHistory: false)
    let result = try await perform(query: gqlQuery)
    return result?.tokens.nodes.map { NFT(from: $0.token) }
  }
  
  public func tokens(_ input: NFTTokensInput) async throws -> [NFT]? {
    switch input {
      case .collectionAddress(let collectionAddress):
        return try await tokens(query: .init(collectionAddresses: [collectionAddress]))
      case .collection(let collection):
        return try await tokens(query: .init(collectionAddresses: [collection.address]))
      case .owner(let ownerAddress):
        return try await tokens(query: .init(ownerAddresses: [ownerAddress]))
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
  
  enum APIError: Error {
    case noAddress
  }
}
