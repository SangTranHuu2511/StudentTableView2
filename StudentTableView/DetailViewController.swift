//
//  DetailViewController.swift
//  DemoTableView
//
//  Created by SangTran on 9/18/17.
//  Copyright © 2017 Sang Tran. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var tempTitle: String?
    var delegate: DetailViewControllerDelegate?
    
    @IBOutlet weak var studentTextFeid: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTextFeid.text = tempTitle
        
    }
    
    @IBAction func saveStudent(_ sender: UIButton) {
        delegate?.passData(name: studentTextFeid.text!)
        navigationController?.popViewController(animated: true)
        
        
    }
}

protocol DetailViewControllerDelegate {
    func passData(name: String)
    
}
