//
//  Depth1Reducer.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

typealias Depth1Reducer = Reducer<
  Depth1State,
  Depth1Action,
  Depth1Environment
>

extension Depth1Reducer {
  init() {
    self = Self
      .combine(
        Depth2Reducer().pullback(
          state: \.depth2State,
          action: /Depth1Action.depth2Action,
          environment: {_ in
            Depth2Environment()
          }
        ),
        .init { state, action, environment in
          .none
        }
      )
  }
}
