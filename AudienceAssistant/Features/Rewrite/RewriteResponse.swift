//
//  Response.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/28/25.
//

import FoundationModels

@Generable(description: "Basic response from rewrite service for social")
public struct RewriteResponse {
	@Guide(description: "The rewritten title of the post")
	var title: String
	
	@Guide(description: "The rewritten body of the post")
	var body: String
	
	@Guide(description: "A single sentence recommendation for improving the social post")
	var extraRecommendations: String
}
