//
//  RootView.swift
//  Experiment
//
//  Created by 최정민 on 2022/07/16.
//

import ComposableArchitecture
import SwiftUI

// MARK: View

struct RootView: View {

  @ObservedObject
  private var viewStore: RootViewStore

  private let store: RootStore

  init(store: RootStore) {
    self.viewStore = ViewStore(store)
    self.store = store
  }

  var body: some View {
    NavigationView {
      ZStack {
        Color
          .red
          .ignoresSafeArea()
        NavigationLink("show depth1") {
          Depth1View(
            store: store
              .scope(
                state: \.depth1State,
                action: RootAction.depth1Action
              )
          )
        }
      }
    }
  }
}

// MARK: Store

typealias RootStore = Store<
  RootState,
  RootAction
>

// MARK: ViewStore

typealias RootViewStore = ViewStore<
  RootState,
  RootAction
>

// MARK: Preview

struct RootView_Previews: PreviewProvider {

  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
      RootView(store: store)
        .preferredColorScheme(colorScheme)
        .previewLayout(.sizeThatFits)
    }
  }

  static let store: RootStore = .init(
    initialState: .init(),
    reducer: .init(),
    environment: .init()
  )
}
