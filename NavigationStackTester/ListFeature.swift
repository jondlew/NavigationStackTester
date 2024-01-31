//
//  ListFeature.swift
//  NavigationStackTester
//
//  Created by Jonathan on 1/31/24.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct ListFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var items: [ListItem]
        var path = StackState<Path.State>()
        public init() {
            items = [ListItem(id: UUID()), ListItem(id: UUID())]
        }
    }
    
    
    public enum Action {
        case path(StackAction<Path.State, Path.Action>)
        case itemTapped(ListItem)
        
    }
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case .path:
                return .none
                
            case let .itemTapped(item):
                state.path.append(.detail(DetailFeature.State(item: item)))
                return .none
            }
        }
    }
    
    
    @Reducer
    public struct Path {
        
        @ObservableState
        public enum State: Equatable {
            case detail(DetailFeature.State)
        }
        
        public enum Action {
            case detail(DetailFeature.Action)
        }
        
        public var body: some ReducerOf<Self> {
       
            Scope(state: \.detail, action: \.detail) {
                DetailFeature()
            }
               
        }
    }
}

public struct ListItem: Equatable, Identifiable {
   public let id: UUID
}
