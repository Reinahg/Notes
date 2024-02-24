//
//  ViewModelTests.swift
//  NotesTests
//
//  Created by Valeria on 19/12/23.
//

import XCTest
@testable import Notes


final class ViewModelTests: XCTestCase {
    var viewmodel: ViewModel!
    
    override func setUpWithError() throws {
        viewmodel = ViewModel(
            createNoteUseCase: CreateNoteUseCaseMock(),
            fetchAllUseCase: FetchAllNotesUseCaseMock(),
            updateNoteUseCase: UpdateNoteUseCaseMock(),
            deleteNoteUseCase: RemoveNoteUseCaseMock())
    }
    
    override func tearDownWithError() throws {
        mockDatabase = []
    }
    
    func testCreateNote(){
        let title = "Test title"
        let text = "Test text"
        
        viewmodel.createNoteWith(title: title, text: text)
        
        XCTAssertEqual(viewmodel.notes.count, 1)
        XCTAssertEqual(viewmodel.notes.first?.title, title)
        XCTAssertEqual(viewmodel.notes.first?.text, text)
    }
    
    func testCreateThreeNote(){
        let title = "Test title"
        let text = "Test text"
        
        let title2 = "Test title2"
        let text2 = "Test text2"
        
        let title3 = "Test title3"
        let text3 = "Test text3"
        
        viewmodel.createNoteWith(title: title, text: text)
        viewmodel.createNoteWith(title: title2, text: text2)
        viewmodel.createNoteWith(title: title3, text: text3)
        
        XCTAssertEqual(viewmodel.notes.count, 3)
        XCTAssertEqual(viewmodel.notes.first?.title, title)
        XCTAssertEqual(viewmodel.notes.first?.text, text)
        
        XCTAssertEqual(viewmodel.notes[1].title, title2)
        XCTAssertEqual(viewmodel.notes[1].text, text2)
        
        XCTAssertEqual(viewmodel.notes[2].title, title3)
        XCTAssertEqual(viewmodel.notes[2].text, text3)
    }
    
    func testUpdateNote(){
        let title = "Test title"
        let text = "Test text"
        
        viewmodel.createNoteWith(title: title, text: text)
        
        let titleUpdated = "Test title updated"
        let textUpdated  = "Test text updated"
        
        if let id = viewmodel.notes.first?.identifier {
            viewmodel.updateNoteWith(identifier: id, newTitle: titleUpdated, newText: textUpdated)
            
            XCTAssertEqual(viewmodel.notes.first?.title, titleUpdated)
            XCTAssertEqual(viewmodel.notes.first?.text, textUpdated)
        } else {
            XCTFail("Note wasnt created")
        }
    }
    
    func testRemoveNote(){
        let title = "Test title"
        let text = "Test text"
        
        viewmodel.createNoteWith(title: title, text: text)
        
        if let id = viewmodel.notes.first?.identifier {
            viewmodel.removeNoteWith(identifier: id)
            
            XCTAssertTrue(viewmodel.notes.isEmpty)
        } else {
            XCTFail("Note wasnt created")
        }
    }
}
