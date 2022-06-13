//
//  NFTImage.swift
//  
//
//  Created by Lee Adkins on 6/12/22.
//

import SwiftUI
import ZoraAPI
import SVGView

//TODO: better placeholder, loading indicators, progress, svg because it's broken.
public struct NFTImage: View {
  let token: NFT
  
  public init(_ token: NFT) {
    self.token = token
  }
  
  public var body: some View {
    if let image = token.image {
      if image.isSVG {
        Rectangle()
          .aspectRatio(1.0, contentMode: .fit)
      } else {
        AsyncImage(url: URL(string: image.originalUrl)) { loaded in
          loaded.resizable()
               .aspectRatio(contentMode: .fit)
               .frame(maxWidth: 300)
        } placeholder: {
          Rectangle()
            .fill(.gray)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 300)
        }
      }
    } else {
      EmptyView()
    }
  }
}
