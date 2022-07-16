//
//  Depth2Reducer.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

typealias Depth2Reducer = Reducer<
  Depth2State,
  Depth2Action,
  Depth2Environment
>

extension Depth2Reducer {
  init() {
    self = Self
      .combine(
        Depth3Reducer().pullback(
          state: \.depth3State,
          action: /Depth2Action.depth3Action,
          environment: { _ in Depth3Environment()}
        ),
        .init { state, action, environment in
          switch action {
          case .depth3Action:
            return .none
            
          case .reset:
            state.random = Int.random(in: 0...100)
            return .none
          }
        }
      )
  }
}
