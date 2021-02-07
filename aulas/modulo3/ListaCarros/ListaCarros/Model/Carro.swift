//
//  Carro.swift
//  ListaCarros
//
//  Created by Felipe Miranda on 20/10/20.
//

import Foundation

// MARK: - Carro
struct Carro: Codable {
    let carros: [CarroElement]
}

// MARK: - CarroElement
struct CarroElement: Codable {
    let id, modelo: String
    let ano: Int
    let cor, imagem: String
}
