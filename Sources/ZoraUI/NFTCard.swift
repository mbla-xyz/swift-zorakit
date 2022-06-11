//
//  NFTCard.swift
//  
//
//  Created by Lee Adkins on 6/11/22.
//

import SwiftUI
import ZoraAPI

public struct NFTCard: View {
  public var token: NFTToken
  
  public init(_ token: NFTToken) {
    self.token = token
  }
  
  public var body: some View {
    Text(token.name ?? "Unknown Token")
//    VStack(alignment: .center) {
//      HStack {
//        Text(token.name ?? "...")
//        Text(token.tokenId)
//      }
//      Text(token.image?.originalUrl ?? "....")
//      Text(token.cloudfrontURL)
//      if let image = token.image, !image.isSVG {
//        AsyncImage(url: URL(string: image.originalUrl)) { loaded in
//          loaded.resizable()
//            .scaledToFill()
//        } placeholder: {
//          EmptyView()
//        }.frame(height: 50)
//      } else if let image = token.image, image.isSVG {
//        EmptyView()
//      }
//    }
  }
}
