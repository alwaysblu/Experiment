//
//  Depth1State.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

struct Depth1State: Equatable {
  var depth2State: Depth2State

  init(
    depth2State: Depth2State = .init()
  ) {
    self.depth2State = depth2State
  }
}
