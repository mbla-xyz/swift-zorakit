//
//  ContentView.swift
//  ExampleApp
//
//  Created by Lee Adkins on 6/11/22.
//

import SwiftUI
import ZoraUI
import ZoraAPI

struct DetailView: View {
  let token: NFT
  
  var body: some View {
    VStack {
      NFTImage(token)
        .frame(maxWidth: 200)
      Text(token.name ?? "")
      Text(token.description ?? "")
      if let attributes = token.attributes {
        List(attributes) { attribute in
          HStack {
            Text(attribute.traitType)
            Text(attribute.value)
          }
        }
      }
    }.padding(20)
      .navigationTitle(token.name ?? "Token")
  }
}

struct ContentView: View {
  @StateObject var collection = NFTCollectionLoader(.collectionAddress("0xa406489360A47Af2C74fc1004316A64e469646A5"))
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(), GridItem()]) {
          ForEach(collection.tokens) { token in
            NavigationLink(value: token) {
              NFTCard(token)
            }
          }
        }.padding(20)
        .navigationDestination(for: NFT.self) { token in
          DetailView(token: token)
        }
      }.navigationTitle("My NFTs")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
