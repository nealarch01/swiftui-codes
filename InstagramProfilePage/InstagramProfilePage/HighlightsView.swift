//
//  HighlightsView.swift
//  InstagramProfilePage
//
//  Created by Neal Archival on 8/23/22.
//

import SwiftUI

fileprivate struct HighlightButton: View {
    let thumbnail: String
    let caption: String
    var body: some View {
        VStack {
            Button(action: {}) {
                Image(thumbnail)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .cornerRadius(50)
            }
            .frame(width: 72, height: 72)
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(hex: 0xc6c6c6), lineWidth: 2)
            }
            Text(caption)
                .font(.system(size: 14))
        }
    }
}

struct HighlightsView: View {
    var body: some View {
        ScrollView(.horizontal) { // Highlights
            // Update later to render using ForLoop with re-usable component
            HStack(spacing: 15) {
                HighlightButton(thumbnail: "apple-ig-culture", caption: "Culture")
                HighlightButton(thumbnail: "apple-ig-tutorial", caption: "Tutorials")
                HighlightButton(thumbnail: "apple-ig-iphone13", caption: "iPhone 13")
                HighlightButton(thumbnail: "apple-ig-experiments", caption: "Experiments")
            }
        } // End of ScrollView
        .frame(height: 100)
        .padding([.leading], 6)
        .clipped()
    }
}

struct HighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightsView()
    }
}
