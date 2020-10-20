//
//  ViewController.swift
//  Mvc2
//
//  Created by Elder Alcantara on 08/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var NomesContatosTableView: UITableView!
    
    var controller: ContatosController = ContatosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.controller.getListContatos { (success, error) in
            
            if success {
                self.NomesContatosTableView.delegate = self
                self.NomesContatosTableView.dataSource = self
            }
            
        }
        
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.numberOfRows
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.controller.loadCurrentContato(indexPath: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.controller.nomeContato
        cell.detailTextLabel? .text = self.controller.telefoneContato
        
        
        return cell
        
    }
    
    
}
