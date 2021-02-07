//
//  CreditCardVM.swift
//  MyBank
//
//  Created by Elder Alcantara on 03/11/20.
//

import Foundation

class CreditCardVM {
    
    typealias  completion <T> = (_ result: T, _ failure: String?) -> Void
    
    private var cartoes: Cartoes?
    private var worker: CreditCardWorker = CreditCardWorker()
    private var isRealod: Bool = false
   
    var cartoesLoad: Cartoes? {
        
        return self.cartoes
    }
    
//    func loadCreditCard() {
//        self.cartoes = self.worker.loadCreditCard()
//    }
    
    func loadCreditCard(completion: @escaping completion<Bool>) {
        
        self.worker.getCreditCard { (response, error) in
            
            if let _response = response {
               
                self.cartoes = _response
                completion(true, nil)
                
            } else {
                
                completion(false, error)
                
            }
            
        }
        
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func appendCreditCard(card: CartoesElement?) {
        
        //self.cartoes?.cartoes.append(card)
        
        if let _card = card {
            
            self.cartoes?.cartoes.append(_card)
            self.isRealod = true
        }
        
    }
    
    var reloadCollection: Bool {
        
        return self.isRealod
    }
    
}
