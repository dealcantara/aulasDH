//
//  Crianca.swift
//  TableView
//
//  Created by Fernando Douglas Vieira on 23/11/2020.
//

import UIKit

class Crianca: Pessoa {
    
    var brinquedo: String
    var altura: Double
    
    var nome: String
    var foto: String
    
    init(nome: String, foto: String, brinquedo: String, altura: Double) {
        self.nome = nome
        self.foto = foto
        self.brinquedo = brinquedo
        self.altura = altura
    }
    
}

extension Crianca: Pessoa2 {
    func title() -> String {
        
        return "Meu nome é \(nome)"
    }
    
    func image() -> UIImage {
        return UIImage(named: foto)!
    }
}
