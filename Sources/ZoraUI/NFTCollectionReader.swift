//
//  NFTCollectionReader.swift
//  
//
//  Created by Lee Adkins on 6/11/22.
//

import SwiftUI
import ZoraAPI

public struct NFTCollectionReader<Content: View>: View {
  @State var collection: [NFTToken]? = nil
  
  public let query: ZoraAPI.NFTTokensInput
  public let content: ([NFTToken]) -> Content
  @State var errorMessage = ""
  
  public init(_ query: ZoraAPI.NFTTokensInput, _ content: @escaping ([NFTToken]) -> Content) {
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
//        collection = nil
        errorMessage = String(describing: error)
      }
    }
  }
}
