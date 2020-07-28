//
//  ViewController.swift
//  OrientacaoObjeto
//
//  Created by Elder Alcantara on 27/07/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var animal: Animal = Animal(tamanho: "Grande", raca: "Golden", cor: "Branco", qtdPatas: 4, genero: "Macho", especie: "Cachorro", idade: 4)
        print(animal.raca)
        
        var animal2: Animal2 = Animal2()
        
    }


}

