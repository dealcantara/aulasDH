//
//  ViewController.swift
//  MVC
//
//  Created by Elder Alcantara on 01/10/20.
//

import UIKit

class ListaCarrosVC: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var resultadoLabel: UILabel!
    
    let controller: ListaCarrosController = ListaCarrosController()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func clicouSortearButton(_ sender: Any) {
        
        self.resultadoLabel.text = self.controller.sortearCarro()
        
    }
    
}

extension ListaCarrosVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.arrayCarrosCount
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.controller.modeloCarro(indexPath: indexPath)
        cell.detailTextLabel?.text = self.controller.anoCarro(indexPath: indexPath)
        
        return cell
    }
    
    
    
}
