//
//  Card.swift
//  Cartoes
//
//  Created by Elder Alcantara on 27/10/20.
//

import Foundation


struct Card: Codable {
    let cards: [CardElement]
}

struct CardElement: Codable {
    let id, nome, data, numero, bandeira: String
}
