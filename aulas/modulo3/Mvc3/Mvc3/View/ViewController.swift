//
//  ViewController.swift
//  Mvc3
//
//  Created by Elder Alcantara on 20/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var controller: CarrosController = CarrosController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.controller.getListCarros { (success, error) in
            
            if success {
                self.myTableView.delegate = self
                self.myTableView.dataSource = self
                
            } else {
                print("ERRO ViewController > getListCarros")
            }
        }
        
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.numberOfRows
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.controller.loadCurrentCarro(indexPath: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.controller.modeloCarro
        cell.detailTextLabel?.text = self.controller.anoCarro
        
        return cell
        
        
    }
    
    
}
