//
//  ProfileHeader.swift
//  InstagramProfilePage
//
//  Created by Neal Archival on 8/22/22.
//

import SwiftUI

struct ProfileHeader: View {
    @Environment(\.colorScheme) var colorScheme
    private let buttonHeight: CGFloat = 40.0
    let name: String
    @Binding var posts: String
    @Binding var followers: String
    @Binding var following: String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
                HStack(spacing: 10) { // Inside contains: profile picture, posts, followers, and following
                    Image("apple-logo")
                        .resizable()
                        .frame(width: 85, height: 85)
                        .cornerRadius(50)
                    
                    Spacer()
                    
                    // Posts, followers, and following
                    HStack(spacing: 10) {
                        VStack {
                            Text("1,050")
                                .font(.system(size: 18, weight: .semibold))
                            Text("Posts")
                                .font(.system(size: 14, weight: .medium))
                        }
                        .frame(width: 70)
                        
                        VStack {
                            Text("28M")
                                .font(.system(size: 18, weight: .semibold))
                            Text("Followers")
                                .font(.system(size: 14, weight: .medium))
                        }
                        .frame(width: 70)
                        
                        VStack {
                            Text("9")
                                .font(.system(size: 18, weight: .semibold))
                            Text("Following")
                                .font(.system(size: 14, weight: .medium))
                        }
                        .frame(width: 70)
                    } // End of HStack
                } // End of HStack
                .padding([.bottom], 2)
                .frame(maxWidth: .infinity)
            
            // For name and bio
            VStack(alignment: .leading) {
                HStack { // Name
                    Text("apple")
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                }
                
                HStack { // Description
                    VStack {
                        Text("Everyone has a story to tell.\nTag ")
                        + Text("#ShotoniPhone") // Fix this later to be clickable
                            .foregroundColor(Color.linkBlue)
                        + Text(" to take part.")
                        + Text("\nOne Apple Park Way, Cupertino, California")
                            .foregroundColor(Color.linkBlue)
                    }
                    .font(.system(size: 16))
                    
                    Spacer()
                }
                
                GeometryReader { geometry in // Follow button, message, and related accounts
                    HStack {
                        Button(action: {}) {
                            Text("Follow")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(Color.white)
                                .frame(width: geometry.size.width * 0.42, height: buttonHeight)
                                .background(Color(hex: 0x0195f5))
                                .cornerRadius(12)
                        }
                        
                        Button(action: {}) {
                            Text("Message")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                .frame(width: geometry.size.width * 0.42, height: buttonHeight)
                                .background(Color.appGray)
                                .cornerRadius(12)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "person.badge.plus")
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                .frame(width: geometry.size.width * 0.12, height: buttonHeight)
                                .background(Color.appGray)
                                .cornerRadius(12)
                        }
                    }
                } // End of GeometryReader
                .frame(height: 45)
                HighlightsView()
                PostsTab()
                    
            }
        } // End of Header Page/Screen VStack
        .preferredColorScheme(.light)
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(
            name: "apple",
            posts: .constant("1,050"),
            followers: .constant("28M"),
            following: .constant("9")
        )
        .padding()
        .previewInterfaceOrientation(.portrait)
    }
}
