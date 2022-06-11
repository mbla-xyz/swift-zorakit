import XCTest
@testable import ZoraAPI

final class ZoraTests: XCTestCase {
  func testZoraToken() async throws {
    let token = try await ZoraAPI.shared.token(address: "0xCa21d4228cDCc68D4e23807E5e370C07577Dd152", id: "3858")
    XCTAssertNotNil(token)
    XCTAssertEqual(token!.name!, "Zorb #3858")
    XCTAssertEqual(token!.tokenId, "3858")
    XCTAssertEqual(token!.image?.isSVG, true)
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
    if let tokens = try? await ZoraAPI.shared.tokens(.owner("leeadkins.eth")) {
      for t in tokens {
        print(t.name)
      }
    }
    if let tokens = try? await ZoraAPI.shared.tokens(.collectionAddress("0xCa21d4228cDCc68D4e23807E5e370C07577Dd152")) {
      for t in tokens {
        print(t.name)
      }
    }
  }
}
