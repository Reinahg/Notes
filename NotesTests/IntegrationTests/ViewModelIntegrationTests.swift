//
//  ViewModelIntegrationTests.swift
//  NotesTests
//
//  Created by Valeria on 2/01/24.
//

import XCTest
@testable import Notes

@MainActor
final class ViewModelIntegrationTests: XCTestCase {
    
    var sut: ViewModel!
    
    override func setUpWithError() throws {
        let database = NotesDatabase.shared
        //Como esta en memoria funciona, en disco se quedaria todo almacenado
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        let createNoteUseCase = CreateNotesUseCase(notesDatabase: database)
        let fetchAllNotesUseCase = FetchAllNotesUseCase(notesDatabase: database)
        
        sut = ViewModel(createNoteUseCase: createNoteUseCase, fetchAllUseCase: fetchAllNotesUseCase)
    }
    
    override func tearDownWithError() throws {
    }
    
    func testCreateNote(){
        sut.createNoteWith(title: "Hello 1", text: "Text 1")
        
        let note = sut.notes.first
        
        XCTAssertNotNil(note)
        XCTAssertEqual(note?.title, "Hello 1")
        XCTAssertEqual(note?.text, "Text 1")
        XCTAssertEqual(sut.notes.count, 1, "Debe de haber una nota")
    }
    
    func testCreateTwoNote(){
        sut.createNoteWith(title: "Hello 1", text: "Text 1")
        sut.createNoteWith(title: "Hello 2", text: "Text 2")
        
        let note = sut.notes.first
        let note2 = sut.notes.last
        
        XCTAssertNotNil(note)
        XCTAssertNotNil(note2)
        XCTAssertEqual(note?.title, "Hello 1")
        XCTAssertEqual(note2?.title, "Hello 2")
        XCTAssertEqual(note?.text, "Text 1")
        XCTAssertEqual(note2?.text, "Text 2")
        XCTAssertEqual(sut.notes.count, 2, "Deben de haber dos notas")
    }
    
    func testFetchAllNotes(){
        sut.createNoteWith(title: "Hello 1", text: "Text 1")
        sut.createNoteWith(title: "Hello 2", text: "Text 2")
        
        let note = sut.notes.first
        let note2 = sut.notes.last
        
        XCTAssertEqual(sut.notes.count, 2)
        XCTAssertEqual(note?.title, "Hello 1")
        XCTAssertEqual(note?.text, "Text 1")
        XCTAssertEqual(note2?.title, "Hello 2")
        XCTAssertEqual(note2?.text, "Text 2")
    }
    
    func testUpdateNote(){
        sut.createNoteWith(title: "Hello 1", text: "Text 1")
        
        guard let note = sut.notes.first else {
            XCTFail()
            return
        }
        
        sut.updateNoteWith(identifier: note.identifier, newTitle: "SwiftBeta", newText: "NewText")
        sut.fetchAllNotes()
        
        XCTAssertEqual(sut.notes.count, 1)
        XCTAssertEqual(sut.notes[0].title, "SwiftBeta")
        XCTAssertEqual(sut.notes[0].text, "NewText")
    }
    
    func testRemoveNote(){
        sut.createNoteWith(title: "Hello 1", text: "Text 1")
        sut.createNoteWith(title: "Hello 2", text: "Text 2")
        sut.createNoteWith(title: "Hello 3", text: "Text 3")
        
        guard let note = sut.notes.last else {
            XCTFail()
            return
        }
        
        sut.removeNoteWith(identifier: note.identifier)
        XCTAssertEqual(sut.notes.count, 2)
        
    }
}
