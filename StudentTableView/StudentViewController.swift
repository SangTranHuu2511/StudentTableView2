//
//  StudentViewController.swift
//  DemoTableView
//
//  Created by SangTran on 9/18/17.
//  Copyright © 2017 Sang Tran. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var students = [
        
        Student(name: "Manh"),
        Student(name: "Sang"),
        Student(name: "Tran")
        
    ]
    var studentIndexPath: IndexPath?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
}

extension StudentViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
        
    }
    
    //config cell
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row].name
        
        return cell
    }
    
    
}

extension StudentViewController: DetailViewControllerDelegate{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        detailViewController.delegate = self
        
        if segue.identifier == "Edit" {
            if let selectedRow = tableView.indexPathForSelectedRow {
                detailViewController.tempTitle = students[selectedRow.row].name
                
            }
        }
    }
    func passData(name: String) {
        if let selectedStudent = tableView.indexPathForSelectedRow {
            let cell = tableView.cellForRow(at: selectedStudent)
            students[selectedStudent.row].name = name
            cell?.textLabel?.text = name
            tableView.deselectRow(at: selectedStudent, animated: true)
            
        } else {
            students.append(Student(name: name))
            
            let indexPath = IndexPath(row: students.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            
        }
        
}
}

