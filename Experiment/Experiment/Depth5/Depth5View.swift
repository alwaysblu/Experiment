//
//  Depth5View.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct Depth5View: View {

  @ObservedObject
  private var viewStore: Depth5ViewStore

  private let store: Depth5Store

  init(store: Depth5Store) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    ZStack {
      Color
        .yellow
        .ignoresSafeArea()
      Button("reset: \(viewStore.random)") {
        viewStore.send(.reset)
      }
    }
  }
}

// MARK: Store

typealias Depth5Store = Store<
  Depth5State,
  Depth5Action
>

// MARK: ViewStore

typealias Depth5ViewStore = ViewStore<
  Depth5State,
  Depth5Action
>

// MARK: Preview

struct Depth5View_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
			Depth5View(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: Depth5Store = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
