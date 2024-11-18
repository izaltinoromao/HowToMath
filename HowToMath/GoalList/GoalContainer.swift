//
//  GoalContainer.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct GoalContainer: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20){
                ForEach(goalMock){
                    goal in GoalListView(goal: goal)
                }
            }
        }
    }
}

#Preview {
    GoalContainer()
}
