//
//  ViewController.swift
//  Array
//
//  Created by Elder Alcantara on 20/07/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var notas: [Int] = [7,9,10,3]
        
        notas.insert(8, at: 2)
        
        print(notas[0])
        print(notas[1])
        print(notas[2])
        print(notas[3])
        print(notas[4])
        
        print("============count========")
        
        //        if notas.count > 0 {
        //            print(notas.count - 1)
        //        }
        print(notas.count)
        
        print("============First========")
        print(notas.first)
        
        print("============Last========")
        print(notas.last)
        
        var name: String? = "Felipe"
        print(name ?? "")
        
        
        notas.append(6)
        print("============count========")
        print(notas.count)
        
        
        notas.remove(at: 3)
        notas.removeLast()
        notas.removeFirst()
        print("============count========")
        print(notas.count)
        
        //        DESAFIO 1: imprimir 10 numeros com função
        
        func showChallenge() {
            
            var challengeArray: [Int] = [1,2,3,4,5,6,7,8,9,10]
            
            for value in challengeArray {
                print(value)
            }
        }
        
        showChallenge()
        
        
        
        //        DESAFIO 2: imprimir nome completo
        
        func printFullName() {
            
            var names: [String] = ["Elder", "Marco", "Alcantara"]
            var fullName: String? = ""
            
            for value in names {
                
                if value == names.last{
                    
                    fullName?.append(value)
                    
                } else {
                    
                    fullName?.append(value)
                    fullName?.append(" ")
                    
                }
                
            }
            
            print(fullName)
        }
        
        printFullName()
        
        
        
        
        
    }
    
    
}
