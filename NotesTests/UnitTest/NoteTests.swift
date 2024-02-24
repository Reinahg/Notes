//
//  NotesTests.swift
//  NotesTests
//
//  Created by Valeria on 19/12/23.
//

import XCTest
@testable import Notes

final class NoteTests: XCTestCase {

    func testNoteInitialization(){
        let title = "Test title"
        let text = "Test text"
        let date = Date()
        
        let note = Note(title: title, text: text, createdAt: date)
        XCTAssertEqual(note.title, title)
        XCTAssertEqual(note.createdAt, date)
        XCTAssertEqual(note.text, text)
    }
}
