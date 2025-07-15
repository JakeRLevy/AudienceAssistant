//
//  ContentView.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/13/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
		NavigationStack {
			RewriteView(viewModel: RewriteViewModel())
		}
    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
