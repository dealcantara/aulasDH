//
//  AddItemController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 01/02/21.
//

import Foundation

protocol AddItemControllerProtocol: class  {
    
    func successAddProduto(array: [ListItem])
    
}

class AddItemController {
    
    var listItem:[ListItem] = []
    weak var delegate:AddItemControllerProtocol?
  
    func addItem(produto: String?, quantidade: String?, preco: String?) {
        
        let model: ListItem = ListItem(quantity: Int(quantidade ?? "0"), product: produto, price: Float(preco ?? "0"))
        
        self.listItem.append(model)
        
        self.successAddItem()
    }
    
    private func successAddItem() {
        
        self.delegate?.successAddProduto(array: self.listItem)
    }
    
}
    
    

