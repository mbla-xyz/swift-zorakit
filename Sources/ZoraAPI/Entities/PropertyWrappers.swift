//
//  File.swift
//  
//
//  Created by Lee Adkins on 6/12/22.
//

import Foundation

@propertyWrapper
public struct EquatableNoop<Value>: Equatable {
  public var wrappedValue: Value
  
  public init(wrappedValue value: Value) {
    self.wrappedValue = value
  }
  
  public static func == (lhs: EquatableNoop<Value>, rhs: EquatableNoop<Value>) -> Bool {
    true
  }
}

@propertyWrapper
public struct HashableNoop<Value: Equatable>: Hashable {
  public var wrappedValue: Value
  
  public init(wrappedValue value: Value) {
    self.wrappedValue = value
  }
  
  public func hash(into hasher: inout Hasher) {}
}

@propertyWrapper
public struct CodableNoop<Value> {
  public var wrappedValue: Value?
  
  public init(wrappedValue: Value?) {
    self.wrappedValue = wrappedValue
  }
  
}
extension CodableNoop: Codable {
  public func encode(to encoder: Encoder) throws {
    // Skip encoding the wrapped value.
  }
  public init(from decoder: Decoder) throws {
    // The wrapped value is simply initialised to nil when decoded.
    self.wrappedValue = nil
  }
}
