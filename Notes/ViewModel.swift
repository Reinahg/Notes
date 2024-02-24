//
//  ViewModel.swift
//  Notes
//
//  Created by Valeria on 14/12/23.
//

import Foundation
import Observation

@Observable
class ViewModel {
    var notes: [Note]
    
    var createNoteUseCase: CreateNoteProtocol
    var fetchAllUseCase: FetchAllNotesUseCaseProtocol
    var updateNoteUseCase: UpdateNoteUseCaseProtocol
    var deleteNoteUseCase: RemoveNoteUseCaseProtocol
    
    init(notes: [Note] = [],
         createNoteUseCase: CreateNoteProtocol = CreateNotesUseCase(),
         fetchAllUseCase: FetchAllNotesUseCaseProtocol = FetchAllNotesUseCase(),
         updateNoteUseCase: UpdateNoteUseCaseProtocol = UpdateNoteUseCase(),
         deleteNoteUseCase: RemoveNoteUseCaseProtocol = RemoveNoteUseCase()) {
        self.notes = notes
        self.createNoteUseCase = createNoteUseCase
        self.fetchAllUseCase = fetchAllUseCase
        self.updateNoteUseCase = updateNoteUseCase
        self.deleteNoteUseCase = deleteNoteUseCase
        fetchAllNotes()
    }
    
    func createNoteWith(title: String, text: String){
        do {
            try createNoteUseCase.createNoteWith(title: title, text: text)
            fetchAllNotes()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func fetchAllNotes(){
        do {
            notes = try fetchAllUseCase.fetchAllNotes()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func updateNoteWith(identifier: UUID, newTitle: String, newText: String?){
        do {
            try updateNoteUseCase.updateNoteWith(identifier: identifier, title: newTitle, text: newText)
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func removeNoteWith(identifier: UUID){
        do {
            try deleteNoteUseCase.removeNoteWith(identifier: identifier)
            fetchAllNotes()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
}
