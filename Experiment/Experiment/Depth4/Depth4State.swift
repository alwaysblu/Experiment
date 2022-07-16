//
//  Depth4State.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture

struct Depth4State: Equatable {
  var depth5State: Depth5State
  var random: Int

  init(
    depth5State: Depth5State = .init()
  ) {
    self.depth5State = depth5State
    random = 0
  }
}
