//
//  RootReducer.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

typealias RootReducer = Reducer<
  RootState,
  RootAction,
  RootEnvironment
>

extension RootReducer {
  init() {
    self = Self
      .combine(
        Depth1Reducer()
          .pullback(
            state: \.depth1State,
            action: /RootAction.depth1Action,
            environment: { _ in
              Depth1Environment()
            }
          ),
        .init { state, action, environment in
          switch action {
          case .depth1Action:
            return .none
          }
        }
      )
  }
}
