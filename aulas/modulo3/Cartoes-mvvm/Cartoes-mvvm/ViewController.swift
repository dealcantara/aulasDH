//
//  ViewController.swift
//  Cartoes-mvvm
//
//  Created by Elder Alcantara on 27/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    
    var viewModel: CartoesViewModel = CartoesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.arrayCartoes = self.loadCreditCard()
        
        self.viewModel.getListCards { (success) in
            
            if success == true {
                self.tableView.delegate = self
                self.tableView.dataSource = self
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.numberOfRows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.viewModel.setCurrentCard(index: indexPath.row)
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.viewModel.nome
        cell.detailTextLabel?.text = self.viewModel.numero
        
        return cell
        
        
    }
    
}
