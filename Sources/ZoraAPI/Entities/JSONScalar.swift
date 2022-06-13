//
//  JSONScalar.swift
//  
//
//  Created by Lee Adkins on 6/12/22.
//

import Foundation
import Apollo

public typealias datetime = String
public typealias Date = String

public enum JSONScalar {
  case dictionary([String: Any])
  case array([Any])
}

extension JSONScalar: JSONDecodable {
  public init(jsonValue value: JSONValue) throws {
    if let dict = value as? [String: Any] {
      self = .dictionary(dict)
    } else if let array = value as? [Any] {
      self = .array(array)
    } else {
      throw JSONDecodingError.couldNotConvert(value: value, to: JSONScalar.self)
    }
  }
}
