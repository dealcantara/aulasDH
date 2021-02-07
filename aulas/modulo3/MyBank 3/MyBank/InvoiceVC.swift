//
//  InvoiceVC.swift
//  MyBank
//
//  Created by Felipe Miranda on 05/11/20.
//

import UIKit

class InvoiceVM {
    
    private var cardID: String? = ""
    
    private var cardListElement: CardListElement?
    
    private var currentInvoice: Invoice? 
    
    init(cardId: String?, cardListElement: CardListElement?, currentInvoice: Invoice? = nil ) {
        
        self.cardID = cardId
        self.cardListElement = cardListElement
        self.currentInvoice = currentInvoice
    }
    
    func loadCardListElement() {
        
        if let path = Bundle.main.path(forResource: "invoice", ofType: "json"){
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let cardList = try JSONDecoder().decode(CardList.self, from: data)
                
                print("=======>cardList\(cardList)")
                
                let list = cardList.cardList?.filter({$0.cardID == self.cardID ?? ""})
                
                self.cardListElement = list?.first
                
            }catch{
                print("Deu ruim no parse")
            }
        }
    }
    
    
    var numberOfRows: Int {
        return self.cardListElement?.invoice?.count ?? 0
    }
    
    func loadCurrentInvoice(index: Int) {
        self.currentInvoice = self.cardListElement?.invoice?[index]
    }
    
    var id: String {
        return self.currentInvoice?.id ?? ""
    }
    
    var nome: String {
        return self.currentInvoice?.nome ?? ""
    }
    
    var data:String {
        return self.currentInvoice?.data ?? ""
    }
    
    var valor:String{
        return "R$ \(String(format: "%.2f", self.currentInvoice?.valor ?? 0))"
    }
    
    var tipo: Tipo {
        
        if let _tipo = self.currentInvoice?.tipo {
            return _tipo
        }
        return .s
    }
}

class InvoiceVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: InvoiceVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ExtratoCell", bundle: nil), forCellReuseIdentifier: "ExtratoCell")
        
        self.viewModel?.loadCardListElement()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
}

extension InvoiceVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: ExtratoCell? = tableView.dequeueReusableCell(withIdentifier: "ExtratoCell", for: indexPath) as? ExtratoCell
        
        self.viewModel?.loadCurrentInvoice(index: indexPath.row)
        cell?.setup(value: self.viewModel)
        
        return cell ?? UITableViewCell()
    }
}
