//
//  PropertyWrappers.swift
//  
//
//  Created by Lee Adkins on 6/12/22.
//
// These property wrappers will be used to silence and ignore
// non-critical changes to entities, allowing better integration
// with things like codable or swiftui

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
  private var value: Value?
  public init(wrappedValue: Value?) {
    self.value = wrappedValue
  }
  public var wrappedValue: Value? {
    get { value }
    set { self.value = newValue }
  }
}
extension CodableNoop: Codable {
  public func encode(to encoder: Encoder) throws {
    // Skip encoding the wrapped value.
  }
  public init(from decoder: Decoder) throws {
    // The wrapped value is simply initialised to nil when decoded.
    self.value = nil
  }
}
