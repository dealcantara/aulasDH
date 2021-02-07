//
//  CardProvider.swift
//  Cartoes
//
//  Created by Elder Alcantara on 27/10/20.
//

import Foundation


class CardProvider {
    private var responseJson: Card?
    var correntCard: CardElement?
    
    var nomeCartao: String {
        return self.correntCard?.nome ?? ""
    }
    
    var numeroCartao: String {
        return self.correntCard?.numero ?? ""
    }
    
    var countCards: Int {
        return responseJson?.cards.count ?? 0
    }
    
    func loadCurrentCard(index: Int) {
        self.correntCard = self.responseJson?.cards[index]
    }
    
    func getListCards(completion: (Bool) -> Void) {
        
        CardsWorker().getListCards { (success, error) in
            
            if error == false {
                
                self.responseJson = success
                completion(true)
                
            } else {
                completion(false)
                print("Erro no parse do JSON! :(")
            }
            
        }
        
    }
    
    
    
}
