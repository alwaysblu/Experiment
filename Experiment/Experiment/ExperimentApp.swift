//
//  ExperimentApp.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import SwiftUI

@main
struct ExperimentApp: App {
    var body: some Scene {
        WindowGroup {
          RootView(
            store: .init(
              initialState: .init(),
              reducer: .init(),
              environment: .init()
            )
          )
        }
    }
}
