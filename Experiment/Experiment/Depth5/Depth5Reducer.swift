//
//  Depth5Reducer.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

typealias Depth5Reducer = Reducer<
  Depth5State,
  Depth5Action,
  Depth5Environment
>

extension Depth5Reducer {
  init() {
    self = Self
      .combine(
        .init { state, action, environment in
          switch action {
          case .reset:
            state.random = Int.random(in: 0...100)
            return .none
          }
        }
      )
  }
}
