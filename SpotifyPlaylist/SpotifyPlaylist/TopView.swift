//
//  TopView.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/3/22.
//

import SwiftUI

struct TopView: View {
    @StateObject private var viewModel = ViewModel()
    let playlistData: Playlist
    private let tempDescription1 = "Rolling with the 'bops' in your Kimbap. Bringing you the songs that are currently trending and everything else in between. Cover: BTS"
    private let tempDescription2 = "A very short playlist description"
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AsyncImage(
                    url: URL(string: playlistData.images[0].url)!,
                    content: { image in
                        image
                            .resizable()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: 225, height: 225)
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(playlistData.name)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.white)
                        Text(tempDescription1)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color.gray)
                            .lineLimit(nil)
                        HStack {
                            Text(playlistData.owner.display_name)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color.white)
                        }
                        HStack(spacing: 6) {
                            Text("\(playlistData.followers.total) likes")
                                .font(.system(size: 16, weight: .medium))
                            Image(systemName: "circle.fill")
                                .font(.system(size: 5))
                            Text(playlistData.calcTotalDuration())
                            Spacer()
                        }
                        .foregroundColor(Color.gray)
                    }
                    .padding([.leading], 15)
                    Spacer()
                }
                .padding([.top], 12)
                .overlay(alignment: .bottomTrailing) {
                    Button(action: {}) {
                        Circle()
                            .frame(width: 100, height: 60)
                            .foregroundColor(Color.SpotifyGreen)
                            .overlay {
                                Image(systemName: "play.fill")
                                    .font(.system(size: 26))
                                    .foregroundColor(Color.SpotifyBlack)
                            }
                            .overlay(alignment: .bottomTrailing) {
                                Circle()
                                    .frame(width: 22, height: 22)
                                    .foregroundColor(Color.LighterBlack)
                                    .overlay {
                                        Image(systemName: "shuffle")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color.SpotifyGreen)
                                    }.padding([.trailing], 14)
                            }
                    }
                }
            } // End of VStack
            .background{
                LinearGradient(
                    colors: [
                        Color(hex: viewModel.receivedAPIColor == true
                              ? viewModel.vibrantColor
                              : 0x191414),
                        Color.SpotifyBlack],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
            }.onAppear {
                print("Fetching from API")
                Task {
                    await viewModel.fetchColorData(imageURL: playlistData.images[0].url)
                }
            }
        } // End of GeometryReader
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(playlistData: Playlist())
    }
}
