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
	
	struct RewriteState {
		var tone: Tone? = nil
		var text: String = ""
		var title: String = ""
		var outputTitle: String = ""
		var outputText: String = ""
	}
	
	var text: String {
			get { currentState.text }
			set {
				currentState.text = String(newValue.prefix(205))
			}
		}
	
}
