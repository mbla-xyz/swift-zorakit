import XCTest
@testable import ZoraAPI

final class ZoraTests: XCTestCase {
  func testZoraToken() async throws {
    let token = try await ZoraAPI.shared.token(token: "0xCa21d4228cDCc68D4e23807E5e370C07577Dd152", id: "3858")
    print("results")
    print(token)
//    print(token?.image?.url)
  }
  
  func testZoraCollections() async throws {
    if let collections = try? await ZoraAPI.shared.collections() {
      for c in collections {
        print(c.address)
        print(c.description)
        print(c.name)
        print(c.symbol)
      }
    }
  }
  
  func testZoraTokens() async throws {
    let token = try await ZoraAPI.shared.token(token: "0xCa21d4228cDCc68D4e23807E5e370C07577Dd152", id: "3858")
    print("results")
    print(token)
//    print(token?.image?.url)
  }
}
