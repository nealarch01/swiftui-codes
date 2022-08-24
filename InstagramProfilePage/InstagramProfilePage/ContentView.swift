//
//  ContentView.swift
//  InstagramProfilePage
//
//  Created by Neal Archival on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea([.all])
                ScrollView {
                    VStack {
                        ProfileHeader(name: "apple", posts: .constant("1,050"), followers: .constant("28M"), following: .constant("9"))
                        Spacer()
                    } // End of page VStack
                }
            } // End of ZStack
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { // Back button
                    Image(systemName: "chevron.left")
                        .padding([.leading], 10)
                }
                
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("apple")
                            .font(.system(size: 18, weight: .bold))
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 10))
                            .foregroundColor(Color(hex: 0x5395e9))
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) { // Options button
                    HStack(spacing: 3) {
                        Image(systemName: "circle.fill")
                        Image(systemName: "circle.fill")
                        Image(systemName: "circle.fill")
                    }
                    .font(.system(size: 3))
                }
            }
            .preferredColorScheme(.dark)
        }
    } // End of some View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
