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
          NFTTokenReader(address: "0xa406489360A47Af2C74fc1004316A64e469646A5", id: "8941") { token in
            NFTCard(token)
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
