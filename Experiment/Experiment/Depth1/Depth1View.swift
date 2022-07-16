//
//  Depth1View.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct Depth1View: View {

  @ObservedObject
  private var viewStore: Depth1ViewStore

  private let store: Depth1Store

  init(store: Depth1Store) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    ZStack {
      Color
        .black
        .ignoresSafeArea()
      NavigationLink("depth2") {
        Depth2View(
          store: store
            .scope(
              state: \.depth2State,
              action: Depth1Action.depth2Action
            )
        )
      }
    }
  }
}

// MARK: Store

typealias Depth1Store = Store<
  Depth1State,
  Depth1Action
>

// MARK: ViewStore

typealias Depth1ViewStore = ViewStore<
  Depth1State,
  Depth1Action
>

// MARK: Preview

struct Depth1View_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      Depth1View(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: Depth1Store = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
