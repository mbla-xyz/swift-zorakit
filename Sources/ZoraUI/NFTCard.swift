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


struct NFTCard_Previews: PreviewProvider {
  
  static var previews: some View {
    Group {
      NFTCard(NFT.sample)
    }.frame(width: 400)
      .padding(40)
  }
}


extension NFT {
  static var sample: NFT {
    let sample = "{\"owner\":\"0xc0b7baddb0631b81f305ed41ebbc8518706b0005\",\"collectionAddress\":\"0xa406489360a47af2c74fc1004316a64e469646a5\",\"attributes\":[{\"value\":\"Flower Field\",\"traitType\":\"Background\"},{\"value\":\"Navy Uniform\",\"traitType\":\"Body\"},{\"value\":\"Orchid\",\"traitType\":\"Head\"},{\"value\":\"Plant\",\"traitType\":\"Class\"}],\"tokenUrlMimeType\":\"application\\/json\",\"image\":{\"size\":\"1324100\",\"mimeType\":\"image\\/png\",\"originalUrl\":\"https:\\/\\/api.zora.co\\/media\\/ETHEREUM-MAINNET\\/0xa406489360a47af2c74fc1004316a64e469646a5\\/7\\/image\\/thumbnail\",\"url\":\"https:\\/\\/surreals.mypinata.cloud\\/ipfs\\/QmToTwWoDVT54HBPGQ1sNYGrEDBMps9ofQyTWF8saFnXUc\\/7.png\"},\"description\":\"The Surreals are a collection of 10,000 hand-painted characters with a vintage naturalist aesthetic.\",\"tokenId\":\"7\",\"name\":\"Surreal #7\",\"tokenUrl\":\"https:\\/\\/surreals.mypinata.cloud\\/ipfs\\/QmWmiuEpxJiZ7uuBiGqcFFuFKk8UnfssMmuV9MQZaoB1wR\\/7\"}"
    
    let token = try! JSONDecoder().decode(NFT.self, from: sample.data(using: .utf8)!)
    return token
  }
}
