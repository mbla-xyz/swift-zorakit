//
//  ContentView.swift
//  ExampleApp
//
//  Created by Lee Adkins on 6/11/22.
//

import SwiftUI
import ZoraUI

struct ContentView: View {
    var body: some View {
        VStack {
          Text("Token")
          NFTCollectionReader(.owner("leeadkins.eth")) { tokens in
            List(tokens) { token in
              HStack {
                
                NFTImage(token).frame(width: 50, height: 50)
                Text(token.name ?? "")
              }
            }
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
