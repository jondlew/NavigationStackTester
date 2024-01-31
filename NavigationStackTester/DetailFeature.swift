//
//  DetailFeature.swift
//  NavigationStackTester
//
//  Created by Jonathan on 1/31/24.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct DetailFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var item: ListItem
        public init(item: ListItem) {
            self.item = item
        }
    }
    
    
    public enum Action {
    
    }
    
    public var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
