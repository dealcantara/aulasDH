//
//  ViewController.swift
//  MvcReview
//
//  Created by Elder Alcantara on 20/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var controller: ContatosController = ContatosController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.controller.getListContatos { (success, error) in
            
            if success {
                self.myTableView.delegate = self
                self.myTableView.dataSource = self
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
        cell.detailTextLabel?.text = self.controller.telefoneContato
        
        return cell
        
    }
    
    
}
