//
//  NotesUITests.swift
//  NotesUITests
//
//  Created by Valeria on 13/02/24.
//

import XCTest

final class NotesUITests: XCTestCase {


    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear nota"]/*[[".otherElements[\"Crear nota\"]",".buttons[\"Crear nota\"].staticTexts[\"Crear nota\"]",".staticTexts[\"Crear nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        let titleTv = collectionViewsQuery.textViews.matching(identifier: "create_note_title").element
        titleTv.tap()
        titleTv.typeText("Aprendiendo tests")
        
        let textTv = collectionViewsQuery.textViews.matching(identifier: "create_note_text").element
        textTv.tap()
        textTv.typeText("Aprendiendo para mejorar cada dia")
        
        app.navigationBars["Nueva nota"]/*@START_MENU_TOKEN@*/.buttons["Crear nota"]/*[[".otherElements[\"Crear nota\"].buttons[\"Crear nota\"]",".buttons[\"Crear nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
//        Segunda nota
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear nota"]/*[[".otherElements[\"Crear nota\"]",".buttons[\"Crear nota\"].staticTexts[\"Crear nota\"]",".staticTexts[\"Crear nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let titleTv2 = collectionViewsQuery.textViews.matching(identifier: "create_note_title").element
        titleTv2.tap()
        titleTv2.typeText("Aprendiendo tests222")
        
        let textTv2 = collectionViewsQuery.textViews.matching(identifier: "create_note_text").element
        textTv2.tap()
        textTv2.typeText("Aprendiendo para mejorar cada dia222")
        
        app.navigationBars["Nueva nota"]/*@START_MENU_TOKEN@*/.buttons["Crear nota"]/*[[".otherElements[\"Crear nota\"].buttons[\"Crear nota\"]",".buttons[\"Crear nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testRemoveNote() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear nota"]/*[[".otherElements[\"Crear nota\"]",".buttons[\"Crear nota\"].staticTexts[\"Crear nota\"]",".staticTexts[\"Crear nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        let titleTv = collectionViewsQuery.textViews.matching(identifier: "create_note_title").element
        titleTv.tap()
        titleTv.typeText("Aprendiendo tests")
        
        let textTv = collectionViewsQuery.textViews.matching(identifier: "create_note_text").element
        textTv.tap()
        textTv.typeText("Aprendiendo para mejorar cada dia")
        
        app.navigationBars["Nueva nota"]/*@START_MENU_TOKEN@*/.buttons["Crear nota"]/*[[".otherElements[\"Crear nota\"].buttons[\"Crear nota\"]",".buttons[\"Crear nota\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let firstNote = collectionViewsQuery.cells.element(boundBy: 0)
        firstNote.tap()
        app.buttons["Eliminar nota"].tap()
    }

}
