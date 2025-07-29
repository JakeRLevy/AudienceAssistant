//
//  RewriteViewModel.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//
import SwiftUI
import Observation
import Combine
import FoundationModels

@MainActor
@Observable
public class RewriteViewModel {
	
	var currentState: RewriteState = .init()
	private let modelSession: LanguageModelSession
	
	public init(currentState: RewriteState = .init() ) {
		self.currentState = currentState
		let instructions = "You are helping the user with their social media campaign.  Your role is publicist/media manager.  You are writing for a specific audience and tone specified by the user.  Create posts focused on attracting or converting the specifed audience using the specified tone. Keep posts approximately the same length unless shortening is decisively better. No generated post should be significantly longer than the original.  We cannot attach pictures at this time but you may suggest that the post have some if it would be helpful for the specific post. If asked to revise something dangerous, illegal, racist, or lewd, respond 'I cannot comply. If you need help brainstorming ideas, use the 'Ideas' tab.'"
		self.modelSession = .init(instructions: instructions)
	}
	
	public struct RewriteState {
		var tone: Tone?
		var text: String
		var title: String
		var previousTitle: String
		var previousText: String
		var recommendation: String
		var industryAudience: Industry?
		var ageAudience: Age?
		
		public init(
			tone: Tone? = nil,
			text: String = "",
			title: String = ""
		) {
			self.tone = tone
			self.text = text
			self.title = title
			self.previousTitle = ""
			self.previousText = ""
			self.recommendation = ""
			self.industryAudience = nil
			self.ageAudience = nil
		}
	}
	
	var title: String {
		get { currentState.title }
		set {
			currentState.title = String(newValue.prefix(100))
		}
	}
	
	var text : String {
		get { currentState.text }
		set {
			currentState.text = String(newValue.prefix(1000))
		}
	}
	
	var audience: any Audience {
		get {
			currentState.ageAudience == nil ? currentState.industryAudience ?? .unknown : currentState.ageAudience ?? Age.adults
		}
	}
	
	var tone: Tone? {
		get { currentState.tone }
		set { currentState.tone = newValue }
	}
	
	func rewrite() {
		let prompt = "Rewrite the following social post for an audience who is \(audience). Use a \(tone ?? .calm) tone"
		
		
		Task {
			do {
				let output = try await modelSession.respond(to: prompt, generating: RewriteResponse.self)
				
				currentState.previousText = currentState.text
				currentState.previousTitle = currentState.title
				currentState.text = output.content.body
				currentState.title = output.content.title
				currentState.recommendation = output.content.extraRecommendations
			}
		}
	}
}
