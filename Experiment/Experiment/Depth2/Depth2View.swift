//
//  Depth2View.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct Depth2View: View {

  @ObservedObject
  private var viewStore: Depth2ViewStore

  private let store: Depth2Store

  init(store: Depth2Store) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    ZStack {
      Color
        .green
        .ignoresSafeArea()
      Button("reset: \(viewStore.random)") {
        viewStore.send(.reset)
      }
    }
  }
}

// MARK: Store

typealias Depth2Store = Store<
  Depth2State,
  Depth2Action
>

// MARK: ViewStore

typealias Depth2ViewStore = ViewStore<
  Depth2State,
  Depth2Action
>

// MARK: Preview

struct Depth2View_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      Depth2View(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: Depth2Store = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
