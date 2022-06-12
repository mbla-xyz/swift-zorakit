# ZoraKit

A package to make it easy to use the ZoraAPI in Swift projects.

## Disclaimer

This is still very work in progress. Everything is in flux, implementations will change, and many things are broken. The current state of the project is really a proof-of-concept as part of the first Zora API Hackathon. We're still thinking through what specific components and APIs to expose, and how it should feel in a more native-swift context.

We (MBLA) have immediate need for such a swift package, so we'll be working through it quickly and getting it to a 0.1 so we can all iterate on it together.

## Why?

The Zora API [https://api.zora.co](https://api.zora.co) is a GraphQL endpoint that provides rich information about NFTs.

While you can totally bring in something like Apollo and just make GraphQL queries yourself, there's a bit of ceremony to set that up.

With ZoraKit, you can use the Zora API in your Swift and SwiftUI projects in a way that feels more native to the platform.

## Using it

(more documentation coming soon)

Add this git repo as a swift package in Xcode. It's not published yet, so just set it to target `main` to stay on the cutting edge.

Import `ZoraAPI` if you just want to make API calls. We're scoping out helpers and abstractions to make it friendlier, but you also can also build your own calls directly with Apollo.  

Known Issue: Apollo doesn't like decoding metadata. That's kind of a big thing. We're working on it.

## Running the example

- Open the ZoraKit.xcworkspace.
- Choose the ExampleApp scheme.
- Run the example app.

## Regenerating Code

(documentation coming soon, but it's just standard apollo codegen for now)

## What's next

- Polish the ZoraAPI callsites, normalize a lot of the data model.
- More helpers to build your own API calls and aggregations.
- More helpers to build UIKit and SwiftUI apps with ZoraUI
- More built-in components for common NFT tasks.
- Actual SVG support.


