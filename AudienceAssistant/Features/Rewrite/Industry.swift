//
//  Industry.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//

import Foundation

public enum Industry: String, Audience {
	public var id: String { rawValue }
	
	case technology = "in technology"
	case finance = "in finance"
	case healthcare = "in healthcare"
	case mediaAndEntertainment = "in media and entertainment"
	case retail = "in retail"
	case government = "in government"
	case education = "in education"
	case energy = "in energy"
	case realEstate = "in real-estate"
	case utilities = "in utilities"
	case manufacturing = "in manufacturing"
	case logistics = "in logistics"
	case professionalServices = "in professional-services"
	case consumerServices = "in consumer-services"
	case students = "students"
	case other = "other"
	case unknown = "unknown"
	
	
	public var description: String { rawValue }
}
