//
//  Industry.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//

import Foundation

public enum Industry: String, Audience {
	public var id: String { rawValue }
	
	case technology = "technology"
	case finance = "finance"
	case healthcare = "healthcare"
	case mediaAndEntertainment = "media-and-entertainment"
	case retail = "retail"
	case government = "government"
	case education = "education"
	case energy = "energy"
	case realEstate = "real-estate"
	case utilities = "utilities"
	case manufacturing = "manufacturing"
	case logistics = "logistics"
	case professionalServices = "professional-services"
	case consumerServices = "consumer-services"
	case other = "other"
	case unknown = ""
	
	public var description: String { rawValue }
}
