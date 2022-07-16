//
//  Depth4View.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct Depth4View: View {

  @ObservedObject
  private var viewStore: Depth4ViewStore

  private let store: Depth4Store

  init(store: Depth4Store) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    ZStack {
      Color
        .brown
        .ignoresSafeArea()
      VStack {
        Button("reset: \(viewStore.random)") {
          viewStore.send(.reset)
        }
        NavigationLink("show depth5") {
          Depth5View(
            store: store.scope(
              state: \.depth5State,
              action: Depth4Action.depth5Action
            )
          )
        }
      }
    }
  }
}

// MARK: Store

typealias Depth4Store = Store<
  Depth4State,
  Depth4Action
>

// MARK: ViewStore

typealias Depth4ViewStore = ViewStore<
  Depth4State,
  Depth4Action
>

// MARK: Preview

struct Depth4View_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      Depth4View(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: Depth4Store = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
