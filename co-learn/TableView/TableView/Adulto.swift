//
//  Pessoa.swift
//  TableView
//
//  Created by Fernando Douglas Vieira on 23/11/2020.
//

import UIKit

class Adulto: Pessoa {
 
    var idade: Int
    var profissao: String
    
    var nome: String
    var foto: String
    
    init(nome: String, foto: String, idade: Int, profissao: String) {
        self.nome = nome
        self.foto = foto
        self.idade = idade
        self.profissao = profissao
    }
    
}

extension Adulto: Pessoa2 {
    func title() -> String {
        
        return "Meu nome é \(nome)"
    }
    
    func image() -> UIImage {
        return UIImage(named: foto)!
    }
}
