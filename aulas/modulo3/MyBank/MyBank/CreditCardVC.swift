//
//  ViewController.swift
//  MyBank
//
//  Created by Elder Alcantara on 29/10/20.
//

import UIKit

class CreditCardVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CreditCardVM?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.register(UINib(nibName: "CreditCardContainerCell", bundle: nil), forCellReuseIdentifier: "CreditCardContainerCell")
        
        //self.cartoes = self.loadCreditCard()
        
        self.viewModel = CreditCardVM()
        self.viewModel?.loadCreditCard()
        
        if self.viewModel?.cartoesLoad != nil {
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
        
        self.tableView.tableFooterView = UIView()
    }
    

}

extension CreditCardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CreditCardContainerCell? = tableView.dequeueReusableCell(withIdentifier: "CreditCardContainerCell", for: indexPath) as? CreditCardContainerCell
        
        
        
        cell?.setup(value: self.viewModel?.cartoesLoad)
        
        return cell ?? UITableViewCell()
        
    }
    
    
}


extension CreditCardVC: CreditCardContainerCellDelegate {
    
    func tappedCreditCard(id: String) {
        
        self.performSegue(withIdentifier: "InvoiceVC", sender: id)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: InvoiceVC? = segue.destination as? InvoiceVC
        vc?.viewModel = InvoiceVM(cardId: sender as? String, cardListElement: nil, currentInvoice: nil)
    }
    
}
