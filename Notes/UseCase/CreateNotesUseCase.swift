//
//  CreateNotesUseCase.swift
//  Notes
//
//  Created by Valeria on 2/01/24.
//

import Foundation

protocol CreateNoteProtocol {
    func createNoteWith(title: String, text: String) throws
}

struct CreateNotesUseCase : CreateNoteProtocol{
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func createNoteWith(title: String, text: String) throws {
        let note: Note = .init(title: title, text: text, createdAt: .now)
        try notesDatabase.insert(note: note)
    }
}
