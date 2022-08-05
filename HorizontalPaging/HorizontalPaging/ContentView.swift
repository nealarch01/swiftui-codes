//
//  ContentView.swift
//  HorizontalPaging
//
//  Created by Neal Archival on 8/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPage: Int = 0
    let numbers: Array<Int> = [10, 20, 30, 40, 50]
    var body: some View {
        ZStack {
            TabView {
                ForEach(numbers, id: \.self) { number in
                    CardView(cardNumber: number)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .id(numbers.count) // This is necessary otherwise the TabView will crash
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
