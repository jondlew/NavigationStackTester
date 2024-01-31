//
//  ListView.swift
//  NavigationStackTester
//
//  Created by Jonathan on 1/31/24.
//

import SwiftUI
import ComposableArchitecture



struct ListView: View {
    @State var store: StoreOf<ListFeature>
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            
                    List {
                        ForEach(store.items) { item in
                            WithPerceptionTracking {
                                Button {
                                    store.send(.itemTapped(item))
                                } label: {
                                    Text(item.id.uuidString)
                                }
                            }
                        }
                    }
                    .navigationTitle("Navigation Stack Tester")
                
                
            } destination: { store in
                switch store.state {
                    
                case .detail:
                    if let store = store.scope(state: \.detail, action: \.detail) {
                        DetailView(store: store)
                    }
                }
            }
        }
    }
}

#Preview {
    ListView(store: Store(initialState: ListFeature.State(), reducer: {
        ListFeature()
    }))
}
