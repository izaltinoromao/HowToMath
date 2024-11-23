//
//  ContentView.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct ContentView: View {
    private var service  = APIService()
    @State private var APIgoals: [GoalType] = []
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack {
            NavigationBar()
            FeaturesGrid()
            CarouselTabView()
            
            if isLoading {
                ProgressView("Carregando objetivos...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                GoalContainer(goals: $APIgoals)
            }
        }.onAppear{
            getGoalsAF()
        }
        .padding()
    }
    
    func getGoalsAF() {
        service.getGoals{goals, error in
            DispatchQueue.main.async {
                if let goals = goals {
                    self.APIgoals = goals
                }
                self.isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}
