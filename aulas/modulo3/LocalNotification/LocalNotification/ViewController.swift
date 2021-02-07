//
//  ViewController.swift
//  LocalNotification
//
//  Created by Elder Alcantara on 28/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var my2TextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    let manager:LocalNotificationManager = LocalNotificationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        
        
        
        // incluir botão no teclado
        let bar = UIToolbar()
        let sendButton = UIBarButtonItem(title: "Send", style: .plain, target: nil, action: #selector(sendTapped))
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        bar.items = [flex,sendButton]
        bar.sizeToFit()
        self.my2TextField.inputAccessoryView = bar

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @objc func sendTapped() {
        
        
        self.manager.requestPermission()
        
        let title:String = self.my2TextField.text ?? ""
        self.manager.addNotification(title: title)
        self.manager.sheduleNotification()
        
        self.my2TextField.text = ""
        self.myTableView.reloadData()
        
    }

    
    
}




extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.manager.notifications.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.manager.notifications[indexPath.row].title

        return cell 
        
    }
    
  
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            var id = self.manager.notifications[indexPath.row].id
            self.manager.removeNotification(id: id)
            print("Deletando o \(id)")
            
            self.manager.notifications.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            
        }
    }
    
    
}
