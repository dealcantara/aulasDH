//
//  CartoesViewModel.swift
//  CardApp
//
//  Created by Elder Alcantara on 29/10/20.
//

import Foundation


class CartoesViewModel {
    
    let worker: CartoesWorker = CartoesWorker()
    
    private var arrayCartoes: [CartoesElement] = []
    private var currentCard: CartoesElement?
    
    
    func getListCards(completion: @escaping (Bool) -> Void) {
        
        self.worker.loadCreditCard { (response, error) in
            
            if error == nil {
                
                self.arrayCartoes = response ?? []
                completion(true)
                
            } else {
                
                print("DEU ERRO! :(")
                completion(false)
                
            }
            
        }
        
    }
    
    
    var numberOfRows: Int {
        
        return self.arrayCartoes.count
        
    }
    
        
    var id: String {
        return self.currentCard?.id ?? ""
    }
    
    var nome: String {
        return self.currentCard?.nome ?? ""
    }
    
    var data: String {
        return self.currentCard?.data ?? ""
    }
    
    var numero: String {
        return self.currentCard?.numero ?? ""
    }
    
    var bandeira: String {
        return self.currentCard?.bandeira ?? ""
    }
    
    
    
    func setCurrentCard(index: Int) {
        self.currentCard = self.arrayCartoes[index]
    }
}
