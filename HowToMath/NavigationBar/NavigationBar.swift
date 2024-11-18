//
//  NavigationBar.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct NavigationBar: View {
    @State private var users: [UserModel] = userMock
    @State private var currentUser: UserModel = userMock.first! //Inicializando com o primeiro user da lista
    @State private var showAddUserModal: Bool = false
    
    var body: some View {
        HStack{
            // Dropdown para selecionar o user
            Menu {
                ForEach(users) { user in
                    Button(user.nome) {
                        currentUser = user
                    }
                }
            } label: {
                Text(currentUser.nome)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            
            // Adicionar novos usuarios
            Button(action: {
                showAddUserModal.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
            }
            .font(.title2)
            .foregroundStyle(.gray)
            .sheet(isPresented: $showAddUserModal) {
                AddUserView(users: $users)
            }
        }.padding()
    }
}

#Preview {
    NavigationBar()
}
