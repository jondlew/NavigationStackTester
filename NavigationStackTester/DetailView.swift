//
//  DetailView.swift
//  NavigationStackTester
//
//  Created by Jonathan on 1/31/24.
//

import SwiftUI
import ComposableArchitecture

struct DetailView: View {
    @State var store: StoreOf<DetailFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text(store.item.id.uuidString)
            }
        }
    }
}

#Preview {
    DetailView(store: Store(initialState: DetailFeature.State(item: ListItem(id: UUID())), reducer: {
        DetailFeature()
    }))
}
