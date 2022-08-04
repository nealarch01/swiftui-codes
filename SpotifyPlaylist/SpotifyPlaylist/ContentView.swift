//
//  ContentView.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/1/22.
//

import SwiftUI

/**
 VStack(spacing: 0) {
     ForEach(Array(viewModel.playlist.tracks.items.enumerated()), id: \.offset) { (index, item) in
         TrackView(trackData: item.track)
     }
 }
 
 GeometryReader { topViewGeometry in
     VStack {
         TopView(playlistData: viewModel.playlist)
             .padding([.top], rootGeometry.safeAreaInsets.top + topViewOffset)
             .background{
                 LinearGradient(
                     colors: [Color(hex: 0x4c74b4), Color.SpotifyBlack],
                     startPoint: .top,
                     endPoint: .bottom
                 )
                 .offset(y: topViewGeometry.frame(in: .global).minY > 0 ? -topViewGeometry.frame(in: .global).minY : 0)
             } // End of Top View
     } // End of VStack
 }
 .frame(height: rootGeometry.size.height) // Add the top safe area inset + offset value (40) to correct top offest
 }
 */

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var iw: CGFloat = 250
    @State private var ih: CGFloat = 250
    private let topViewOffset: CGFloat = 50
    
    var body: some View {
        ZStack {
            Color.SpotifyBlack
                .overlay {
                    GeometryReader { geometry in
                        ScrollView {
                            LazyVStack(pinnedViews: .sectionHeaders) {
                                TopView(playlistData: viewModel.playlist)
                                    .frame(minHeight: 400)
                                ForEach(Array(viewModel.playlist.tracks.items.enumerated()), id: \.offset) { (index, item) in
                                    TrackView(trackData: item.track)
                                }
                            }.offset(y: geometry.safeAreaInsets.top + topViewOffset)
                        }
                    }
                }
        } // End of ZStack
        .ignoresSafeArea(edges: [.all])
        .preferredColorScheme(.dark)
    } // End of body
} //

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
