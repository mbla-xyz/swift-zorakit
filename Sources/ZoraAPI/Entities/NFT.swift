//
//  NFT.swift
//
//
//  Created by Lee Adkins on 6/10/22.
//

import Foundation

public struct NFT: Codable, Identifiable, Hashable {
  public struct Attribute: Codable, Identifiable, Hashable {
    public var id: String { "\(traitType)_\(value)"}
    public var traitType: String
    public var value: String
    
    public init?(from nodeTokenAttribute: TokensQuery.Data.Token.Node.Token.Attribute) {
      if let traitType = nodeTokenAttribute.traitType, let value = nodeTokenAttribute.value {
        self.traitType = traitType
        self.value = value
      } else {
        return nil
      }
    }
    
    public init?(from tokenAttribute: TokenQuery.Data.Token.Token.Attribute) {
      if let traitType = tokenAttribute.traitType, let value = tokenAttribute.value {
        self.traitType = traitType
        self.value = value
      } else {
        return nil
      }
    }
  }
  
  public struct Image: Codable, Identifiable, Hashable {
    public var id: String { url }
    public var url: String
    public var mimeType: String
    public var size: String
    public var originalUrl: String
    
    public var isSVG: Bool {
      return mimeType.contains("svg")
    }
    
    public init?(from nodeTokenImage: TokensQuery.Data.Token.Node.Token.Image?) {
      if let url = nodeTokenImage?.url,
         let size = nodeTokenImage?.size,
         let mimeType = nodeTokenImage?.mimeType,
         let originalUrl = nodeTokenImage?.mediaEncoding?.asImageEncodingTypes?.thumbnail {
        
        self.url = url
        self.size = size
        self.mimeType = mimeType
        self.originalUrl = originalUrl
        
      } else {
        return nil
      }
    }
    
    public init?(from tokenImage: TokenQuery.Data.Token.Token.Image?) {
      if let url = tokenImage?.url,
         let size = tokenImage?.size,
         let mimeType = tokenImage?.mimeType,
         let originalUrl = tokenImage?.mediaEncoding?.asImageEncodingTypes?.thumbnail {
        
        self.url = url
        self.size = size
        self.mimeType = mimeType
        self.originalUrl = originalUrl
        
      } else {
        return nil
      }
    }
  }
  
  public var id: String { "\(collectionAddress)_\(tokenId)" }
  public var tokenId: String
  public var collectionAddress: String
  public var owner: String?
  public var name: String?
  public var description: String?
  public var metadata: String?
  public var tokenUrl: String?
  public var tokenUrlMimeType: String?
  public var image: Image?
  public var attributes: [Attribute]?
  
  public init(from tokenData: TokenQuery.Data.Token.Token) {
    self.tokenId = tokenData.tokenId
    self.collectionAddress = tokenData.collectionAddress
    self.owner = tokenData.owner
    self.name = tokenData.name
    self.description = tokenData.description
    self.metadata = tokenData.metadata
    self.tokenUrl = tokenData.tokenUrl
    self.tokenUrlMimeType = tokenData.tokenUrlMimeType
    
    self.attributes = tokenData.attributes?.compactMap { Attribute(from: $0)}
    
    self.image = Image(from: tokenData.image)
  }
  
  public init(from tokenNodeData: TokensQuery.Data.Token.Node.Token) {
    self.tokenId = tokenNodeData.tokenId
    self.collectionAddress = tokenNodeData.collectionAddress
    self.owner = tokenNodeData.owner
    self.name = tokenNodeData.name
    self.description = tokenNodeData.description
    self.metadata = tokenNodeData.metadata
    self.tokenUrl = tokenNodeData.tokenUrl
    self.tokenUrlMimeType = tokenNodeData.tokenUrlMimeType
    
    self.attributes = tokenNodeData.attributes?.compactMap { Attribute(from: $0)}
    
    self.image = Image(from: tokenNodeData.image)
    
  }
}
