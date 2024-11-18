//
//  AddUserView.swift
//  HowToMath
//
//  Created by user269369 on 11/18/24.
//

import SwiftUI

struct AddUserView: View {
    @Binding var users: [UserModel]
    @Environment(\.dismiss) var dismiss
    @State private var newUserName: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Novo Usuário")) {
                    TextField("Nome do Usuário", text: $newUserName)
                }
                
                Button(action: {
                    guard !newUserName.isEmpty else { return } // Evita adicionar usuários com nome vazio
                    let newUser = UserModel(id: users.count + 1, nome: newUserName)
                    users.append(newUser)
                    dismiss() // Fecha o modal
                }) {
                    Text("Adicionar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Adicionar Usuário")
            .navigationBarItems(leading: Button("Cancelar") {
                dismiss()
            })
        }
    }
}
