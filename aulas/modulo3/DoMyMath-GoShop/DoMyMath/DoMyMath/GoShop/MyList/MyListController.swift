//
//  MyListController.swift
//  DoMyMath
//
//  Created by Vitor Gomes on 02/02/21.
//

import Foundation



class MyListController {
    
    
    private var myListItens:[ListItem] = []
    
    
    func count() -> Int {
        return self.myListItens.count
    }
    
    
    func currentItem(indexPath: IndexPath) -> ListItem {
        return self.myListItens[indexPath.row]
    }
    
    
    func addItems(items: [ListItem]){
        self.myListItens += items
    }
    

}
