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

