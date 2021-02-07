//
//  ViewController.swift
//  Cartoes
//
//  Created by Elder Alcantara on 27/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    var provider: CardProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.provider = CardProvider()
        self.provider?.getListCards(completion: {(success) in
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
        
        return self.provider?.countCards ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.provider?.loadCurrentCard(index: indexPath.row)
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.provider?.nomeCartao
        cell.detailTextLabel?.text = self.provider?.numeroCartao
        
        return cell
        
        
    }
    
    
}
