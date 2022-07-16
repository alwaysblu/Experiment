//
//  Depth2State.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

struct Depth2State: Equatable {
  var depth3State: Depth3State
  var random: Int

  init(
    depth3State: Depth3State = .init()
  ) {
    self.depth3State = depth3State
    random = 0
  }
}
