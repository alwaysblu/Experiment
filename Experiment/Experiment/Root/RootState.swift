//
//  RootState.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

struct RootState: Equatable {
  var depth1State: Depth1State

  init(
    depth1State: Depth1State = .init()
  ) {
    self.depth1State = depth1State
  }
}
