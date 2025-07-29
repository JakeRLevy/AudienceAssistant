//
//  Audience.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//

public enum Age: String, Audience {
	public var id: String {
		self.rawValue
	}
	
	case children
	case teenagers
	case youngAdults
	case adults
	case seniors
	
	public var description: String {
		switch self {
		case .children:
			return "< 13 years"
		case .teenagers:
			return "13-18 years old"
		case .youngAdults:
			return "19-34 years old"
		case .adults:
			return "35-54 years old"
		case .seniors:
			return "55+ years old"
		}
	}
	
}
