//
//  ViewController.swift
//  ListaCarros
//
//  Created by Felipe Miranda on 20/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var provider: CarroProvider?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.provider = CarroProvider()
        
        self.provider?.getListCarros(completion: { (success) in
            
            if success {
                
                self.myTableView.delegate = self
                self.myTableView.dataSource = self
            }
        })
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.provider?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.provider?.loadCurrentCarro(index: indexPath.row)
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.provider?.modelo
        cell.detailTextLabel?.text = self.provider?.ano
        
        return cell
    }
    
    
    
}

