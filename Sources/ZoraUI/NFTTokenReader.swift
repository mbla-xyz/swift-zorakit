//
//  NFTTokenReader.swift
//  
//
//  Created by Lee Adkins on 6/11/22.
//

import SwiftUI
import ZoraAPI

public struct NFTTokenReader<Content: View>: View {
  @State var token: NFTToken? = nil
  
  let address: String
  let id: String
  let content: (NFTToken) -> Content
  
  public init(address: String, id: String, _ content: @escaping (NFTToken) -> Content) {
    self.address = address
    self.id = id
    self.content = content
  }
  
  public var body: some View {
    Group {
      if let token {
        content(token)
      } else {
        EmptyView()
      }
    }
      .task {
        do {
          token = try await ZoraAPI.shared.token(address: address, id: id)
        } catch {
          token = nil
        }
      }
  }
}
