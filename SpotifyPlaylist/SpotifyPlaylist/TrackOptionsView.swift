//
//  TrackOptionsView.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/2/22.
//

import SwiftUI

struct TrackOptionsView: View {
    @Binding var optionsActive: Bool
    @Binding var liked: Bool
    let trackData: Track
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            VStack {
                Spacer()
                GeometryReader { geometry in
                    ScrollView(.vertical, showsIndicators: false) {
                        AsyncImage(
                            url: URL(string: trackData.album.images[0].url),
                            content: { image in
                                image.resizable()
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        .frame(width: 250, height: 250)
                        
                        Text("Idol")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundColor(Color.white)
                        Text("BTS")
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(Color.gray)
                        LazyVStack(spacing: 44) {
                            TrackOptionButton(
                                systemName: liked == true ? "heart.fill" : "heart",
                                title: liked == true ? "Liked" : "Like",
                                action: { liked.toggle() })
                            .foregroundColor(liked == true ? Color.SpotifyGreen : Color.white)
                            TrackOptionButton(systemName: "minus.circle", title: "Hide song", action: {})
                            TrackOptionButton(systemName: "text.badge.plus", title: "Add to queue", action: {})
                            TrackOptionButton(systemName: "rectangle.stack.badge.plus", title: "Add to playlist", action: {})
                            TrackOptionButton(systemName: "square.and.arrow.up", title: "Share", action: {})
                            TrackOptionButton(systemName: "dot.radiowaves.left.and.right", title: "Go to radio", action: {})
                            TrackOptionButton(systemName: "record.circle", title: "View album", action: {})
                            Color.clear.padding(80) // Set padding to allow "overscroll" caused by overlay
                        }
                        .foregroundColor(Color.white)
                        .padding([.leading], 26)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .padding([.top], geometry.safeAreaInsets.top + 50)
                }.overlay(alignment: .bottom) {
                    Button(action: {
                        optionsActive.toggle()
                    }) {
                        Text("Close")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 90)
                            .background(
                                LinearGradient(
                                    colors: [Color.SpotifyBlack,
                                             Color.SpotifyBlack.opacity(0.9)],
                                    startPoint: .center,
                                    endPoint: .top)
                            )
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        .background(BlurredBackground())
        .ignoresSafeArea()
    }
}

struct TrackOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        TrackOptionsView(optionsActive: .constant(true), liked: .constant(false), trackData: Track())
    }
}
