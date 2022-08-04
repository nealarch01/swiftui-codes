//
//  TrackOptionButton.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/3/22.
//

import SwiftUI

struct TrackOptionButton: View {
    let systemName: String
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: self.action) {
            HStack(alignment: .center, spacing: 25) {
                Image(systemName: self.systemName)
                Spacer()
            }.overlay(alignment: .leading) {
                Text(self.title)
                    .offset(x: 50)
            }
            .font(.system(size: 24))
        }
        
    }
}

struct TrackOptionButton_Previews: PreviewProvider {
    static var previews: some View {
        TrackOptionButton(systemName: "circle", title: "Circle", action: {})
    }
}
