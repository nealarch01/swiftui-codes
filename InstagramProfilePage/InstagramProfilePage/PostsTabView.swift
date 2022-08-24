//
//  PostsTab.swift
//  InstagramProfilePage
//
//  Created by Neal Archival on 8/23/22.
//

import SwiftUI

struct PostsTab: View {
    @State var currentScreen: String = "POSTS"
    private let tabIconSize: CGFloat = 26
    private let numOfTabs: Int = 4
    private let currentTabMarkerWidth: CGFloat = 2
    private let edgeDiff: CGFloat = 5
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack {
                    Button(action: { updateCurrentTab("POSTS") }) {
                        Image(systemName: "squareshape.split.3x3") // Posts
                            .font(.system(size: tabIconSize))
                            .foregroundColor(Color.tabItemGray)
                            .frame(width: geometry.size.width / 4 + edgeDiff)
                            .offset(x: edgeDiff)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(currentScreen == "POSTS" ? Color.tabItemGray : Color.clear)
                                    .frame(height: currentTabMarkerWidth)
                                    .offset(y: 10)
                            }
                            .ignoresSafeArea()
                    }
                    
                    Button(action: { updateCurrentTab("REELS") }) {
                        Image(colorScheme == .dark ? "ig-reels-dark" : "ig-reels-light")
                            .resizable()
                            .frame(width: tabIconSize, height: tabIconSize)
                            .frame(width: geometry.size.width / 4 - edgeDiff)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(currentScreen == "REELS" ? Color.tabItemGray : Color.clear)
                                    .frame(height: currentTabMarkerWidth)
                                    .offset(y: 10)
                            }
                    }
                    
                    Button(action: { updateCurrentTab("GUIDES") }) {
                        Image(colorScheme == .dark ? "ig-guides-dark" : "ig-guides-light")
                            .resizable()
                            .frame(width: tabIconSize, height: tabIconSize)
                            .frame(width: geometry.size.width / 4 - edgeDiff)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(currentScreen == "GUIDES" ? Color.tabItemGray : Color.clear)
                                    .frame(height: currentTabMarkerWidth)
                                    .offset(y: 10)
                            }
                    }
                    
                    
                    Button(action: { updateCurrentTab("TAGGED") }) { // Tagged
                        Image(colorScheme == .dark ? "ig-tagged-dark" : "ig-tagged-light")
                            .resizable()
                            .frame(width: tabIconSize, height: tabIconSize)
                            .frame(width: geometry.size.width / 4 + edgeDiff)
                            .offset(x: -edgeDiff)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(currentScreen == "TAGGED" ? Color.tabItemGray : Color.clear)
                                    .frame(height: currentTabMarkerWidth)
                                    .offset(y: 10)
                            }
                            .ignoresSafeArea()
                    }
                    
                } // End of HStack
                .buttonStyle(PlainButtonStyle())
                .frame(width: geometry.size.width, height: 54)
            } // Centers in the middle
        } // End of Root ZStack
    }
    
    private func updateCurrentTab(_ tabName: String = "POSTS") {
        switch tabName {
        case "POSTS", "REELS", "TAGGED", "GUIDES":
            withAnimation(.spring()) {
                self.currentScreen = tabName
            }
        
        default:
            return
        }
    }
}

struct PostsTab_Previews: PreviewProvider {
    static var previews: some View {
        PostsTab()
    }
}
