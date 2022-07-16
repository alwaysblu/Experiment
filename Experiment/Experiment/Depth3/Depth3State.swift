//
//  Depth3State.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

struct Depth3State: Equatable {
  var depth4State: Depth4State
  var random: Int

  init(
    depth4State: Depth4State = .init()
  ) {
    self.depth4State = depth4State
    random = 0
  }
}
