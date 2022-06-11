//
//  Token.swift
//
//
//  Created by Lee Adkins on 6/10/22.
//

import Foundation

public struct NFTToken: Codable, Identifiable {
  
  public struct Image: Codable, Identifiable {
    public var id: String { url }
    public var url: String
    public var mimeType: String
    public var size: String
    
    public var isSVG: Bool {
      return mimeType.contains("svg")
    }
    
    //    GraphQLField("mediaEncoding", type: .object(MediaEncoding.selections)),
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
  
  public init(from tokenData: TokenQuery.Data.Token.Token) {
    self.tokenId = tokenData.tokenId
    self.collectionAddress = tokenData.collectionAddress
    self.owner = tokenData.owner
    self.name = tokenData.name
    self.description = tokenData.description
    self.metadata = tokenData.metadata
    self.tokenUrl = tokenData.tokenUrl
    self.tokenUrlMimeType = tokenData.tokenUrlMimeType
    if let url = tokenData.image?.url,
       let size = tokenData.image?.size,
       let mimeType = tokenData.image?.mimeType {
      self.image = Image(url: url, mimeType: mimeType, size: size)
    }
    
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
    if let url = tokenNodeData.image?.url,
       let size = tokenNodeData.image?.size,
       let mimeType = tokenNodeData.image?.mimeType {
      self.image = Image(url: url, mimeType: mimeType, size: size)
    }
  }
}
