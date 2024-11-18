//
//  NavigationBar.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Button("Izaltino") {}.font(.headline).fontWeight(.bold)
            Button(action:{}){
                Image(systemName: "plus.circle.fill")
            }.font(.title2).foregroundStyle(.gray)
        }
    }
}

#Preview {
    NavigationBar()
}
