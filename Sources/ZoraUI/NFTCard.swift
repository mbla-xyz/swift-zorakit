//
//  NFTCard.swift
//  
//
//  Created by Lee Adkins on 6/11/22.
//

import SwiftUI
import ZoraAPI
import SVGView

// TODO: Config modifiers with style.
// init with style maybe too.
// Styles can be large/small or detailed/simple. That kind of thing.
public struct NFTCard: View {
  public var token: NFT
  
  public init(_ token: NFT) {
    self.token = token
  }
  
  public var body: some View {
    VStack {
      NFTImage(token)
        .aspectRatio(1, contentMode: .fit)
        .frame(maxWidth: .infinity)

      Text(token.name ?? "Unknown")
        .font(.headline)
        .foregroundColor(.primary)
    }
  }
}
