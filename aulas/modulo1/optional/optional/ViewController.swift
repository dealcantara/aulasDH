//
//  ViewController.swift
//  optional
//
//  Created by Elder Alcantara on 19/07/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var name: String?
        var age: Int? = 37
        var fullName: String?
        
        //        "?" para declarar que o campo é opcional
        
        print(name)
        print(age)
        
        //        primeira forma de olhar dentro de uma variavel (ou constate) opcional
        
        if let _name = name {
            print(_name)
        } else {
            print("Name not found!")
        }
        
        //        segunda forma de olhar dentro de uma variavel (ou constate) opcional
        
        guard let _age = age else { return print("Age not found!") }
        print(_age)
        
        //        terceira forma de olhar dentro de uma variavel (ou constate) opcional
        
        let _fullName: String = fullName ?? "Zezinho" // if ternário
        print(_fullName)
        
        
        var perfil: String = "\(fullName ?? ""), idade: \(_age)"
        print(perfil)
    }
    
    
}

