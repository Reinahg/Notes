//
//  RemoveNoteUseCase.swift
//  Notes
//
//  Created by Valeria on 16/01/24.
//

import Foundation

protocol RemoveNoteUseCaseProtocol {
     func removeNoteWith(identifier: UUID) throws
}

struct RemoveNoteUseCase : RemoveNoteUseCaseProtocol{
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func removeNoteWith(identifier: UUID) throws {
        try notesDatabase.remove(identifier: identifier)
    }
}
