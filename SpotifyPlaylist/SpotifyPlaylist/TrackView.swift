//
//  TrackView.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/1/22.
//

import SwiftUI

struct TrackView: View {
    @StateObject private var viewModel = ViewModel()
    
    let trackData: Track
    
    var body: some View {
        HStack {
            Button(action: {}) {
                HStack {
                    AsyncImage(
                        url: URL(string: trackData.album.images[0].url)!,
                        content: { image in
                            image.resizable()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .frame(width: 60, height: 60)
                    .padding([.leading], 10)
                    VStack(alignment: .leading, spacing: 4) {
                        // Change this when active (future implementation)
                        Text(trackData.name)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.white)
                        HStack(spacing: 4) {
                            Text("\(displayArtists(artists: trackData.album.artists))")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color.gray)
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .foregroundColor(Color.gray)
                            Text(trackData.album.name)
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color.gray)
                        }
                    }
                    .lineLimit(1)
                    Spacer()
                }
            } // End of select button
            HStack {
                Button(action: {
                    viewModel.liked.toggle()
                }) {
                    Image(systemName: viewModel.liked == true ? "heart.fill" : "heart")
                        .font(.system(size: 20))
                        .foregroundColor(viewModel.liked == true ? Color.green : Color.white)
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 6)
                }
                Button(action: {
                    viewModel.optionsActive.toggle()
                }) {
                    HStack(spacing: 1) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 5))
                        Image(systemName: "circle.fill")
                            .font(.system(size: 5))
                        Image(systemName: "circle.fill")
                            .font(.system(size: 5))
                    }
                    .foregroundColor(Color.gray)
                    .padding([.trailing], 12)
                    .padding([.leading], 8)
                    .padding([.top, .bottom], 14)
                }
            }
        }
        .frame(maxHeight: 70)
        .padding([.top, .bottom], 4)
        .background(Color.SpotifyBlack)
        .fullScreenCover(isPresented: $viewModel.optionsActive) {
            // Pass optionsActive binding to allow toggle closure
            TrackOptionsView(optionsActive: $viewModel.optionsActive, liked: $viewModel.liked, trackData: trackData)
        }.onAppear{
            UIView.setAnimationsEnabled(true)
        }
    }
    
    private func displayArtists(artists: Array<Artists>) -> String {
        var str: String = ""
        let n = artists.count
        for (index, artist) in artists.enumerated() {
            if index < n - 1 {
                str += "\(artist.name), "
                continue
            }
            str += artist.name
        } // End of for loop
        return str
    }
    
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView(trackData: Track())
    }
}
