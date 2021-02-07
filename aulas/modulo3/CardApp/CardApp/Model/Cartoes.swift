//
//  Cartoes.swift
//  CardApp
//
//  Created by Elder Alcantara on 29/10/20.
//

import Foundation


struct Cartoes: Codable {
    let cartoes: [CartoesElement]
}

struct CartoesElement: Codable {
    let id, nome, data, numero, bandeira: String
}

