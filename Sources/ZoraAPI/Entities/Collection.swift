//
//  File.swift
//  
//
//  Created by Lee Adkins on 6/10/22.
//

import Foundation

public struct NFTCollection: Codable, Identifiable {
  public var id: String { address }
  public var address: String
  public var name: String?
  public var symbol: String?
  public var description: String
  public var totalSupply: Int?
  
  public init(from collectionNode: CollectionsQuery.Data.Collection.Node) {
    self.address = collectionNode.address
    self.name = collectionNode.name
    self.description = collectionNode.description
    self.symbol = collectionNode.symbol
    self.totalSupply = collectionNode.totalSupply
  }
}


