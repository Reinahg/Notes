//
//  FetchAllNotesUseCase.swift
//  Notes
//
//  Created by Valeria on 2/01/24.
//

import Foundation

protocol FetchAllNotesUseCaseProtocol {
    func fetchAllNotes() throws -> [Note]
}

struct FetchAllNotesUseCase : FetchAllNotesUseCaseProtocol{
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func fetchAllNotes() throws -> [Note]{
        try notesDatabase.fetchAll()
    }
}
