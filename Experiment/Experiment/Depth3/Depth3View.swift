//
//  Depth3View.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct Depth3View: View {

  @ObservedObject
  private var viewStore: Depth3ViewStore

  private let store: Depth3Store

  init(store: Depth3Store) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    ZStack {
      Color
        .pink
        .ignoresSafeArea()
      VStack {
        Button("reset: \(viewStore.random)") {
          viewStore.send(.reset)
        }
        NavigationLink("show depth4") {
          Depth4View(
            store:
              store.scope(
                state: \.depth4State,
                action: Depth3Action.depth4Action
              )
          )
        }
      }
    }
  }
}

// MARK: Store

typealias Depth3Store = Store<
  Depth3State,
  Depth3Action
>

// MARK: ViewStore

typealias Depth3ViewStore = ViewStore<
  Depth3State,
  Depth3Action
>

// MARK: Preview

struct Depth3View_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      Depth3View(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: Depth3Store = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
