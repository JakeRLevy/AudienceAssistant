//
//  ContentView.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/13/25.
//

import SwiftUI
import SwiftData
import FoundationModels

@available(iOS 26.0, *)
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
	private var model = SystemLanguageModel.default

    var body: some View {
		
	
		NavigationStack {
			switch model.availability {
			  case .available:
				  // Show your intelligence UI.
				
				
				RewriteView(viewModel: RewriteViewModel())
			  case .unavailable(.deviceNotEligible):
				// Sorry Screen UI, device not supported
				Text("Sorry Screen UI, device not supported")
			case .unavailable(.appleIntelligenceNotEnabled):
				  // Screen with a button to jump to Settings or the correct settings menu
				Text("Screen with a button to jump to Settings or the correct settings menu")
			  case .unavailable(.modelNotReady):
				  // Just a few moments
				Text("Just a few moments")
			  case .unavailable(_):
				  // Sorry Something went wrong
				Text("Sorry something went wrong")
			  }
			
		}
    }

}

#Preview {
	if #available(iOS 26.0, *) {
		ContentView()
			.modelContainer(for: Item.self, inMemory: true)
	} else {
		// Fallback on earlier versions
	}
}
