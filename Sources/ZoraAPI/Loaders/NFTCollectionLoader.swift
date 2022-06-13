//
//  NFTCollectionLoader.swift
//  
//
//  Created by Lee Adkins on 6/12/22.
//

import Foundation

@MainActor
public class NFTCollectionLoader: ObservableObject {
  private var query: ZoraAPI.NFTTokensInput
  @Published public var tokens: [NFT] = []
  
  public init(_ query: ZoraAPI.NFTTokensInput) {
    self.query = query
    Task(priority: .userInitiated) {
      await load()
    }
  }
  
  func load() async {
    do {
      tokens = try await ZoraAPI.shared.tokens(query) ?? []
    } catch {
      // Errors...
      // these should be able to be called back from the
    }
  }
}
