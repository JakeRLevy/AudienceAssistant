//
//  RewriteViewModel.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//
import SwiftUI

@Observable
@MainActor
public class RewriteViewModel {
	
	var State: RewriteState = .init()
	
	struct RewriteState {
		va
		var tone: Tone? = nil
		var text: String = ""
		var title: String = ""
		var outputTitle: String = ""
		var outputText: String = ""
	}
}
