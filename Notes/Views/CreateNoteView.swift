//
//  CreateNoteView.swift
//  Notes
//
//  Created by Valeria on 14/12/23.
//

import SwiftUI

struct CreateNoteView: View {
    var viewModel: ViewModel
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("",text: $title, prompt: Text("*Título"), axis: .vertical)
                        .accessibilityIdentifier("create_note_title")
                    TextField("",text: $text, prompt: Text("*Texto"), axis: .vertical)
                        .accessibilityIdentifier("create_note_text")
                } footer: {
                    Text("* El título es obligatorio")
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    } label: {
                        Text("Cerrar")
                    }
                }
                
                ToolbarItem(){
                    Button{
                        viewModel.createNoteWith(title: title, text: text)
                        dismiss()
                    } label: {
                        Text("Crear nota")
                            .bold()
                    }
                }
            }
            .navigationTitle("Nueva nota")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CreateNoteView(viewModel: .init())
}
