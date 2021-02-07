//
//  Cartoes.swift
//  Cartoes-mvvm
//
//  Created by Elder Alcantara on 27/10/20.
//

import Foundation


struct Cartoes: Codable {
    let cartoes: [CartoesElement]
}

struct CartoesElement: Codable {
    let id, nome, data, numero, bandeira: String
}
