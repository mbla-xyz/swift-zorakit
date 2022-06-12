//
//  NFTCollectionReader.swift
//  
//
//  Created by Lee Adkins on 6/11/22.
//

import SwiftUI
import ZoraAPI

public struct NFTCollectionReader<Content: View>: View {
  @State var collection: [NFT]? = nil
  
  public let query: ZoraAPI.NFTTokensInput
  public let content: ([NFT]) -> Content
  @State var errorMessage = ""
  
  public init(_ query: ZoraAPI.NFTTokensInput, _ content: @escaping ([NFT]) -> Content) {
    self.query = query
    self.content = content
  }
  
  public var body: some View {
    Group {
      if let collection {
        content(collection)
      } else {
        Text(errorMessage)
      }
    }
    .task {
      do {
        collection = try await ZoraAPI.shared.tokens(query)
      } catch {
        errorMessage = String(describing: error)
      }
    }
  }
}
