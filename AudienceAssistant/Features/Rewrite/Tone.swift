//
//  Tone.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//

import Foundation

public enum Tone: String, CaseIterable, Identifiable {
	case upbeat
	case persuasive
	case witty
	case neutral
	case enthusiastic
	case calm
	case excited
	
	public var id: String {
		self.rawValue
	}
}
