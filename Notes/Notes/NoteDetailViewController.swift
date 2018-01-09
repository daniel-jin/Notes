//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Daniel Jin on 1/8/18.
//  Copyright © 2018 Daniel Jin. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    var note: Note?

    // MARK: - IBOutlets & IBActions
    
    @IBOutlet weak var noteTextView: UITextView!
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let noteText = noteTextView.text,
            !noteText.isEmpty else { return }
        
        // Check if this is a new note or an existing note
        
        if let note = note {
            // Update existing note
            NoteController.shared.updateNote(note: note, text: noteText)
            
        } else {
            // Create & save new note
            NoteController.shared.createNote(text: noteText)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If this is an existing note, load with the correct text
        if let note = note {
            noteTextView.text = note.text
        }

    }
    
    

}
