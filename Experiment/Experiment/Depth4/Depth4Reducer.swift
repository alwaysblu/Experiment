//
//  Depth4Reducer.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

typealias Depth4Reducer = Reducer<
  Depth4State,
  Depth4Action,
  Depth4Environment
>

extension Depth4Reducer {
  init() {
    self = Self
      .combine(
        Depth5Reducer().pullback(
          state: \.depth5State,
          action: /Depth4Action.depth5Action,
          environment: { _ in
            Depth5Environment()
          }
        ),
        .init { state, action, environment in
          switch action {
          case .depth5Action:
            return .none

          case .reset:
            state.random = Int.random(in: 0...100)
            return .none
          }
        }
      )
  }
}
