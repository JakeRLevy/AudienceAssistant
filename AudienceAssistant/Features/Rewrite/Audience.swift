//
//  Audience.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//

public protocol Audience: CaseIterable, Hashable, Identifiable, CustomStringConvertible{
	var id: String { get }
	var description: String { get }
}
