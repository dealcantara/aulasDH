//
//  ViewController.swift
//  CoreData_Template
//
//  Created by Nadilson Santana on 18/07/19.
//  Copyright © 2019 DigitalHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var yearOldTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    @IBAction func btnAdd(_ sender: Any) {
        
    }
    
    @IBAction func btnRemove(_ sender: Any) {
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = ""
            
            return cell
        }
        return UITableViewCell()
    }
}

