//
//  NFTCollectionLoader.swift
//  
//
//  Created by Lee Adkins on 6/12/22.
//

import Foundation

// FIXME: we're using this as a viewmodel in the sample app, but it doesn't necessarily have to be mainactor here
// Ideally, this would be used within your own ViewModel that you're controlling for actor purposes.
@MainActor
public class NFTCollectionLoader: ObservableObject {
  private var query: ZoraAPI.NFTTokensInput
  private var perPage: Int = 4
  @Published public var tokens: [NFT] = []
  @Published public var nextPageInfo: PageInfo = PageInfo()
  @Published public var isLoading: Bool = false
  
  public init(_ query: ZoraAPI.NFTTokensInput) {
    self.query = query
    Task(priority: .userInitiated) {
      await load()
    }
  }
  
  public func load() async {
    do {
      isLoading = true
      let (pageInfo, tokens) = try await ZoraAPI.shared.tokens(query, page: .init(limit: perPage))
      self.nextPageInfo = pageInfo
      self.tokens = tokens ?? []
      isLoading = false
    } catch {
      // Errors...
      // these should be able to be called back from the
      // Set and save these in a way on this loader so clients can understand what happened.
      isLoading = false
    }
  }
  
  public func loadNextPage() async {
    do {
      isLoading = true
      let (pageInfo, tokens) = try await ZoraAPI.shared.tokens(query, page: .init(limit: perPage, after: nextPageInfo.endCursor))
      self.nextPageInfo = pageInfo
      self.tokens.append(contentsOf: tokens ?? [])
      isLoading = false
    } catch {
      // Errors...
      // Set and save these in a way on this loader so clients can understand what happened.
      isLoading = false
    }
  }
}
