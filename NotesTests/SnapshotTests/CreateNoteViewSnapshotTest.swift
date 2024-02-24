//
//  CreateNoteViewSnapshotTest.swift
//  NotesTests
//
//  Created by Valeria on 7/02/24.
//

import XCTest
import SnapshotTesting
@testable import Notes

final class CreateNoteViewSnapshotTest: XCTestCase {

    //La primera vez no funciona, la segunda si por que toma la imagen tomada en el test anterior
    
    //Si quiero actualizar la imagen de referencia la muevo a la carpeta de referencia @-
    func testCreateNoteView() throws {
        let createNoteView = CreateNoteView(viewModel: .init())
        assertSnapshot(of: createNoteView, as: .image)
    }
    
    func testCreateNoteViewWithData(){
        let createNoteView = CreateNoteView(viewModel: .init(), title: "TestSnap", text: "Prueba snapshot")
        assertSnapshot(of: createNoteView, as: .image)
    }
}
