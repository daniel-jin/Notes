//
//  Note.swift
//  Notes
//
//  Created by Daniel Jin on 1/8/18.
//  Copyright © 2018 Daniel Jin. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    static let textKey = "text"
    
    // MARK: - Properties
    var text: String
    
    // MARK: - Initializer
    init(text: String) {
        self.text = text
    }
    
    // Initialize from persistant store
    convenience init?(dictionary: [String: Any]) {
        
        guard let text = dictionary[Note.textKey] as? String else { return nil }
        
        self.init(text: text)
        
    }
    
    var dictionaryRepresentation: [String: String] {
        
        return [Note.textKey: text]
        
    }
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    
    return lhs.text == rhs.text
    
}
