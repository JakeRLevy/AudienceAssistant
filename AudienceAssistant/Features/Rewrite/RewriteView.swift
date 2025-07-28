//
//  RewriteView.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//

import SwiftUI
import Observation
import Combine

public struct RewriteView: View {
	@State var viewModel: RewriteViewModel
	
	public init(viewModel: RewriteViewModel) {
		self.viewModel = viewModel
	}
	public var body: some View {
		
		ScrollView {
			VStack(alignment: .leading) {
				
				titleEditor
				Spacer()
					.frame(height: 15)
				ExpandingEditor()
			}
		}
	}
	
	private var titleEditor: some View {
		
		VStack {
			Text("Title Editor")
				.font(.headline)
			
			TextEditor(text: $viewModel.currentState.text)
				.frame(maxHeight: 75)
				.padding([.leading, .trailing], 16)
				.border(Color.gray)
				.onChange(of: viewModel.currentState.text) { _, newValue in
					if newValue.count > 100 {
						viewModel.currentState.text = String(newValue.prefix(100))
					}
				}
			
		}
		.padding(16)
	}
}
