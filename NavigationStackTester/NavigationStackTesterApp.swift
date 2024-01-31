//
//  NavigationStackTesterApp.swift
//  NavigationStackTester
//
//  Created by Jonathan on 1/31/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct NavigationStackTesterApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(store: Store(initialState: ListFeature.State(), reducer: {
                ListFeature()
            }))
        }
    }
}
