//
//  ExpandingEditor.swift
//  AudienceAssistant
//
//  Created by Jacob Levy on 7/14/25.
//

import SwiftUI


struct ExpandingEditor : View {
	
	@State var text: String = ""
	var body: some View {
		LazyVStack(alignment: .leading) {
			Text("Post Editor")
				.padding(.leading, 26)
			ZStack(alignment: .leading) {
				TextEditor(text: $text)
					.border(Color.black)
					.frame(minHeight: 154)
					.padding(16)
					.onChange(of: text) { _, newValue in
						if newValue.count > 1000 {
							text = String(newValue.prefix(1000))
						}
					}
					.overlay {
						VStack {
							Spacer()
							HStack(alignment: .bottom) {
								Spacer()
								Text("\(text.count)/\(1000)")
									.font(.caption)
									.padding([.bottom, .trailing], 24)
							}
						}
					}
				if text.isEmpty {
				Text("Enter Your Post here for a rewrite")
						.frame(height: 154, alignment: .top)
						.padding(.leading, 20)
						.padding(.top, 15)

										
				}
			}.frame(alignment: .topLeading)
		}
	}
	
}

#Preview {
	ExpandingEditor()
}
