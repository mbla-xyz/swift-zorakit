//
//  File.swift
//  
//
//  Created by Lee Adkins on 6/14/22.
//

import Foundation

public struct PageInfo: Codable {
  public var limit: Int
  public var hasNextPage: Bool
  public var endCursor: String?
  
  public init() {
    self.limit = 0
    self.hasNextPage = false
  }
  
  public init(from gqlPageInfo: TokensQuery.Data.Token.PageInfo?) {
    self.limit = gqlPageInfo?.limit ?? 0
    self.hasNextPage = gqlPageInfo?.hasNextPage ?? false
    self.endCursor = gqlPageInfo?.endCursor
  }
}
