//
//  NoteController.swift
//  Notes
//
//  Created by Daniel Jin on 1/8/18.
//  Copyright © 2018 Daniel Jin. All rights reserved.
//

import Foundation

class NoteController {
    
    static let notesKey = "notes"
    
    // Singleton
    static let shared = NoteController()
    
    // Source of truth
    var notes: [Note] = []
    
    init() {
        loadFromPersistantStore()
    }
    
    // MARK: - CRUD functions
    
    // Create
    func createNote(text: String) {
        
        let note = Note(text: text)
        notes.append(note)
        
        saveToPersistantStore()
        
    }
    
    // Delete
    func deleteNote(note: Note) {
        
        if notes.contains(note) {
            guard let index = notes.index(of: note) else { return }
            notes.remove(at: index)
        }
        
        saveToPersistantStore()
        
    }
    
    
    
    func loadFromPersistantStore() {
        
        let userDefaults = UserDefaults.standard
        
        guard let notesDict = userDefaults.object(forKey: NoteController.notesKey) as? [[String: Any]] else { return }
        
        notes = notesDict.flatMap{ Note(dictionary: $0) }
        
    }
    
    func saveToPersistantStore() {
        
        let userDefaults = UserDefaults.standard
        
        let notesDict = notes.map{ $0.dictionaryRepresentation }
        
        userDefaults.set(notesDict, forKey: NoteController.notesKey)
        
    }
    
}
