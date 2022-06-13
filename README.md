# ZoraKit

The best way to use the Zora API in your Swift projects.

## Disclaimer

This is still very much a work in progress, and is really a proof-of-concept as part of the first Zora API Hackathon. We're still thinking through what components are helpful and which parts of the API to surface more naturally, so this repo will feel very in flux as we experiment in the open.

We have an immediate need for this kind of package, so we'll be working through it and quickly getting to a 0.1 so we can all iterate on it together.

## Why?

The Zora API [https://api.zora.co](https://api.zora.co) is an extremely powerful NFT API that provides metadata, sales, mints, market data, media, and more.

While you can totally bring in something like Apollo and just make GraphQL queries yourself, there's a bit of ceremony to set that up.

The ZDK and Zora's other NFT Components make it extremely easy to use the Zora API in your web or React-based projects, but those tools don't exist on native platforms like iOS. Yet.

With ZoraKit, you can use the Zora API in your Swift and SwiftUI projects in a way that feels more native to the platform.

## Using it

Add this git repo as a swift package in Xcode. It's not published yet, so just set it to target `main` to stay on the cutting edge.

Import `ZoraAPI` if you just want to make API calls. We're scoping out helpers and abstractions to make it friendlier, but you also can also build your own calls directly with Apollo.

- `ZoraAPI.shared`: A ready to use instance of the Zora API.
  - `.token(address, id)`: Returns an NFT and its metadata.
  - `.tokens(search)`: Returns a list of NFTs based on your query parameters.
    - `search`:
      - `.owner(address or ENS)`: List all NFTs owned by an address
      - `.collectionAddress(address): List all NFTs in a collection
      - more soon
  - `perform(query)`: Perform your own custom GraphQL query via Apollo. Useful if you need something while we're building more abstractions.
- `NFTCollectionLoader`: A prebuilt collection loader perfect for use in a View Model or in your SwiftUI views
- `NFTLoader`: Same as above, but for individual tokens.
  
Import `ZoraUI` to use some of our built-in SwiftUI views.

- `NFTCard`: A basic display of an NFT. Useful for a grid.
- `NFTImage`: Automatically loads and displays images from a token.
  - SVG and other multimedia support is a WIP.

How easy is it to make something useful? Display a grid of your own NFTs:

```swift
struct ContentView: View {
  @StateObject var collection = NFTCollectionLoader(.owner("leeadkins.eth"))
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(), GridItem()]) {
        ForEach(collection.tokens) { token in
          NavigationLink(value: token) {
            NFTCard(token)
          }
        }
      }.padding(20)
    }
  }
}
```

We're currently working on better loader options and additional building blocks.

## Running the example

- Open the ZoraKit.xcworkspace.
- Select the ExampleApp scheme.
- Run the example app.

## Regenerating the Schema

We used the standard Apollo Codegen to generate Schema.swift, but we did have to enable passthroughCustomScalars for metadata decoding. 

(documentation and helpers coming soon)

## What's next

- Pagination. This is coming first.
- Polish the ZoraAPI callsites, normalize a lot of the data model.
- More helpers to build your own API calls and aggregations.
- More helpers to build UIKit and SwiftUI apps with ZoraUI
- More built-in components for common NFT tasks.
- Actual SVG support.
- More support for Zora NFTs and the assorted `content`


