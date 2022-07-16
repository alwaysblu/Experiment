//
//  Depth3Reducer.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

typealias Depth3Reducer = Reducer<
  Depth3State,
  Depth3Action,
  Depth3Environment
>

extension Depth3Reducer {
  init() {
    self = Self
      .combine(
        Depth4Reducer().pullback(
          state: \.depth4State,
          action: /Depth3Action.depth4Action,
          environment: { _ in Depth4Environment()}
        ),
        .init { state, action, environment in
          switch action {
          case .depth4Action:
            return .none

          case .reset:
            state.random = Int.random(in: 0...100)
            return .none
          }
        }
      )
  }
}
