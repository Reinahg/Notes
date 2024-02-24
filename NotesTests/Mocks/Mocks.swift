//
//  Mocks.swift
//  NotesTests
//
//  Created by Valeria on 17/01/24.
//

import Foundation
@testable import Notes

var mockDatabase: [Note] = []

struct CreateNoteUseCaseMock: CreateNoteProtocol{
    func createNoteWith(title: String, text: String) throws {
        let note = Note(title: title, text: text, createdAt: .now)
        mockDatabase.append(note)
    }
}

struct FetchAllNotesUseCaseMock: FetchAllNotesUseCaseProtocol{
    func fetchAllNotes() throws -> [Note] {
        return mockDatabase
    }
}

struct UpdateNoteUseCaseMock: UpdateNoteUseCaseProtocol {
    func updateNoteWith(identifier: UUID, title: String, text: String?) throws {
        if let index = mockDatabase.firstIndex(where: {$0.identifier == identifier}){
            mockDatabase[index].title = title
            mockDatabase[index].text = text
        }
    }
}

struct RemoveNoteUseCaseMock : RemoveNoteUseCaseProtocol{
    func removeNoteWith(identifier: UUID) throws {
        if let index = mockDatabase.firstIndex(where: {$0.identifier == identifier}){
            mockDatabase.remove(at: index)
        }
    }
}
