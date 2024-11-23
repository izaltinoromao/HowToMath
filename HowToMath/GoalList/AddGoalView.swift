import SwiftUI

struct AddGoalView: View {
    private var service  = APIService()
    
    @Binding var goals: [GoalType]
    @Environment(\.dismiss) var dismiss
    
    @State private var titulo = ""
    @State private var descricao = ""
    @State private var icone = ""
    @State private var isPosting = false
    
    init(goals: Binding<[GoalType]>) {
        _goals = goals
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Título", text: $titulo)
                TextField("Descrição", text: $descricao)
                TextField("Ícone (ex: book.circle.fill)", text: $icone)
                
                if isPosting {
                    ProgressView("Adicionando...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Button("Adicionar") {
                        addGoal()
                    }
                    .disabled(titulo.isEmpty || descricao.isEmpty || icone.isEmpty)
                }
            }
            .navigationTitle("Nova Meta")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addGoal() {
        guard !titulo.isEmpty, !descricao.isEmpty, !icone.isEmpty else { return }
        isPosting = true
        
        let newGoal = GoalType(id: (goals.last?.id ?? 0) + 1, icone: icone, titulo: titulo, descricao: descricao)
        
        service.addGoal(newGoal: newGoal) { result in
            DispatchQueue.main.async {
                isPosting = false
                switch result {
                case .success(let goal):
                    goals.append(goal)
                    dismiss()
                case .failure(let error):
                    print("Erro ao adicionar meta: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
