//
//  GoalContainer.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct GoalContainer: View {
    @Binding var goals: [GoalType]
    @State private var isPresentingAddGoal = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20){
                ForEach(goals){
                    goal in GoalListView(goal: goal)
                }
                
                Button(action: {
                    isPresentingAddGoal = true
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                            .foregroundStyle(.green)
                        Spacer()
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $isPresentingAddGoal) {
            AddGoalView(goals: $goals)
        }
    }
}

#Preview {
    GoalContainer(goals: .constant(goalMock))
}
