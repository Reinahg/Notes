//
//  UpdateNoteView.swift
//  Notes
//
//  Created by Valeria on 14/12/23.
//

import SwiftUI

struct UpdateNoteView: View {
    var viewModel: ViewModel
    let id: UUID
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("",text: $title, prompt: Text("*Título"), axis: .vertical)
                    TextField("",text: $text, prompt: Text("*Texto"), axis: .vertical)
                } footer: {
                    Text("* El título es obligatorio")
                }
            }
            Button(action: {
                viewModel.removeNoteWith(identifier: id)
                dismiss()
            }, label: {
                Text("Eliminar nota")
                    .foregroundStyle(.gray)
                    .underline()
            })
            .buttonStyle(BorderlessButtonStyle())
            Spacer()
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .toolbar{
            ToolbarItem(){
                Button{
                    viewModel.updateNoteWith(identifier:id, newTitle: title, newText: text)
                    dismiss()
                } label: {
                    Text("Guardar")
                        .bold()
                }
            }
        }
        .navigationTitle("Modificar nota")
    }
}

#Preview {
    NavigationStack{
        UpdateNoteView(viewModel: .init(), id: .init(), title: "Valeria", text: "Henao")
    }
}
