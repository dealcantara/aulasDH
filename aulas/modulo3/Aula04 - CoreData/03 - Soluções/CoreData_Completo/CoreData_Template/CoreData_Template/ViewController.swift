//
//  ViewController.swift
//  CoreData_Template
//
//  Created by Nadilson Santana on 18/07/19.
//  Copyright © 2019 DigitalHouse. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var yearOldTextField: UITextField!
    
    let dataManager = DataManager()
    var arrayInformation:[NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.loadData()
    }
    
    func loadData() {
        dataManager.loadData { (result) in
            if let arrayPessoa = result {
                self.arrayInformation = arrayPessoa
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func btnAdd(_ sender: Any) {
        
        dataManager.saveInformation(name: nameTextField.text ?? "", yearOld: yearOldTextField.text ?? "") { (success) in
            if success {
                self.loadData()
            } else {
                print("Deu Ruim")
            }
        }
        
    }
    
    @IBAction func btnRemove(_ sender: Any) {
        dataManager.deletePerson(name: nameTextField.text ?? "") { (success) in
            if success {
                self.loadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            
            cell.textLabel?.text = arrayInformation[indexPath.row].value(forKey: "name") as? String
            cell.detailTextLabel?.text = arrayInformation[indexPath.row].value(forKey: "yearOld") as? String
            
            return cell
        }
        return UITableViewCell()
    }
}

