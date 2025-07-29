//
//  RewriteView.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//

import SwiftUI
import Observation
import Combine
import Playgrounds


public struct RewriteView: View {
	@State var viewModel: RewriteViewModel

	@State var tone: Tone? = nil
	
	@State var audienceByIndustry: Bool = false
	public init(viewModel: RewriteViewModel) {
		self.viewModel = viewModel
	}
	public var body: some View {
		
		ScrollView {
			VStack(alignment: .leading) {
				
				titleEditor
				Spacer()
					.frame(height: 15)
				ExpandingEditor(text: $viewModel.text)
				
				Button(
					action: { audienceByIndustry.toggle() },
					label: { Text("Tap to switch Audience Type")
				}
				)
				
				Spacer().frame(height: 0)
				
				if audienceByIndustry {
					HStack {
						Text("Audience by Industry")
						Picker(
							selection: $viewModel.currentState.industryAudience,
							label: Text("Audience By Industry")
						) {
							ForEach(Industry.allCases) { industry in
								Text("\(industry)")
							}
						}.pickerStyle(.inline)
							
					}
				} else {
					HStack {
						Text("Audience By Age")
						Picker(
							selection: $viewModel.currentState.ageAudience,
							label: Text("Audience By Age")
						) {
							ForEach(Age.allCases) { ageGroup in
								Text("\(ageGroup)")
							}
						}.pickerStyle(.wheel)
					}
				}
				
				HStack {
					Text("Choose your tone:")
					Picker(
						selection: $tone,
						label: Text("Audience By Age")
					) {
						ForEach(Tone.allCases) { tone in
							Text("\(tone)")
						}
					}.pickerStyle(.wheel)
				}
				if !viewModel.currentState.recommendation.isEmpty {
					Text(viewModel.currentState.recommendation)
				}
				
				Spacer()
				
				Button(action:
					viewModel.rewrite
				) { Text("Rewrite!") }
			}
			.onChange(of: viewModel.currentState.industryAudience) { _, _ in
				viewModel.currentState.ageAudience = nil
			}
			.onChange(of: viewModel.currentState.ageAudience) { _, _ in
				viewModel.currentState.industryAudience = nil
			}
		}
	}

	
	private var titleEditor: some View {
		
		VStack {
			Text("Title Editor")
				.font(.headline)
			
			TextEditor(text: $viewModel.title)
				.frame(maxHeight: 75)
				.padding([.leading, .trailing], 16)
				.border(Color.gray)
			
			Text("")
		}
		.padding(16)
	}
}


#Preview {
	RewriteView(viewModel: .init())
}
