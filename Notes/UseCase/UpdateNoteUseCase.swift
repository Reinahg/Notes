//
//  UpdateNoteUseCase.swift
//  Notes
//
//  Created by Valeria on 16/01/24.
//

import Foundation

protocol UpdateNoteUseCaseProtocol {
     func updateNoteWith(identifier: UUID, title: String, text: String?) throws
}

struct UpdateNoteUseCase : UpdateNoteUseCaseProtocol{
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func updateNoteWith(identifier: UUID, title: String, text: String?) throws {
        try notesDatabase.update(identifier: identifier, title: title, text: text)
    }
}
