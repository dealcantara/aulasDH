//
//  CreditCardVM.swift
//  MyBank
//
//  Created by Elder Alcantara on 03/11/20.
//

import Foundation

class CreditCardVM {
    
    private var cartoes: Cartoes?
    private var worker: CreditCardWorker = CreditCardWorker()
    
    
    var cartoesLoad: Cartoes? {
        return self.cartoes
    }
    
    func loadCreditCard() {
        
        self.cartoes = self.worker.loadCreditCard()
        
    }
    
    
    var numberOfSections: Int {
        return 1
    }
}
