//
//  ContentView.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
            FeaturesGrid()
            CarouselTabView()
            GoalContainer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
