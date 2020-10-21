//
//  Carro.swift
//  Mvc3
//
//  Created by Elder Alcantara on 20/10/20.
//

import Foundation

class Carro {
    var id: String?
    var modelo: String?
    var ano: Int?
    var cor: String?
    var imagem: String?
    
    init(id: String, modelo: String, ano: Int, cor: String, imagem: String) {
        self.id = id
        self.modelo = modelo
        self.ano = ano
        self.cor = cor
        self.imagem = id
    }
    
    
}
