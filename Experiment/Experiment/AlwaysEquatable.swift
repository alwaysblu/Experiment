//
//  AlwaysEquatable.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import Foundation

@propertyWrapper
public struct AlwaysEquatable<Value> {
  public var wrappedValue: Value

  public init(wrappedValue: Value) {
    self.wrappedValue = wrappedValue
  }
}

extension AlwaysEquatable: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    true
  }
}