//
//  ContentView.swift
//  Notes
//
//  Created by Valeria on 14/12/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var viewModel: ViewModel = .init()
    @State var showCreateNote: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(value: note){
                        VStack(alignment: .leading){
                            Text(note.title)
                                .foregroundStyle(.primary)
                            Text(note.getText)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .status){
                    Button(action: {
                        showCreateNote.toggle()
                    }, label: {
                        Label("Crear nota", systemImage: "square.and.pencil")
                            .labelStyle(TitleAndIconLabelStyle())
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                }
            }
            .navigationTitle("Notas")
            .navigationDestination(for: Note.self, destination: {
                note in
                UpdateNoteView(viewModel: viewModel, id: note.identifier, title: note.title, text: note.getText)
            })
            .fullScreenCover(isPresented: $showCreateNote, content: {
                CreateNoteView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    ContentView(viewModel: .init(notes: [
        .init(title: "Swift beta", text: "Texto 1", createdAt: .now),
        .init(title: "Swift beta", text: "Texto 2", createdAt: .now),
        .init(title: "Swift beta", text: "Texto 3", createdAt: .now)
    ]))
}
