//
//  NotesListTableViewController.swift
//  Notes
//
//  Created by Daniel Jin on 1/8/18.
//  Copyright © 2018 Daniel Jin. All rights reserved.
//

import UIKit

class NotesListTableViewController: UITableViewController {
    
    // Storyboard identifiers
    
    static let noteCellKey = "noteCell"
    static let toNoteDetailSegue = "toNoteDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteController.shared.notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotesListTableViewController.noteCellKey, for: indexPath)

        let note = NoteController.shared.notes[indexPath.row]
        
        cell.textLabel?.text = note.text
        
        return cell
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? NoteDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else { return }
        
        if segue.identifier == NotesListTableViewController.toNoteDetailSegue {
            
            let note = NoteController.shared.notes[indexPath.row]
            
            detailVC.note = note
            
        }
        
    }

}
