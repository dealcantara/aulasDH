//
//  ViewController.swift
//  ViewController
//
//  Created by Elder Alcantara on 22/07/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let carDic:[String:Any] = ["cor":"preto", "modelo":"Civic", "qtdPortas": 4, "motor": 1.8]
        
        print(carDic["cor"] ?? "")
        
        
        //        criar uma funcao que imprima os 4 alunos usando um unico print
        
        func printAlunos() {
            
            let aluno1: [String:Any] = ["nome":"Elder Alcantara", "idade":37, "nota1":8, "nota2":6, "nota3":7, "nota4":8, "turma":"A"]
            let aluno2: [String:Any] = ["nome":"Danilo Coelho", "idade":10, "nota1":10, "nota2":10, "nota3":10, "nota4":10, "turma":"B"]
            let aluno3: [String:Any] = ["nome":"Aline Borges", "idade":34, "nota1":9, "nota2":10, "nota3":9, "nota4":10, "turma":"C"]
            let aluno4: [String:Any] = ["nome":"Zé Mane", "idade":100, "nota1":3, "nota2":4, "nota3":4, "nota4":5, "turma":"D"]
            
            let arrayAlunos:[[String:Any]] = [aluno1, aluno2, aluno3, aluno4]
            
            for value in arrayAlunos {
                print("\(value["nome"] ?? ""), \(value["idade"] ?? ""), \(value["nota1"] ?? ""), \(value["nota2"] ?? ""), \(value["nota3"] ?? ""), \(value["nota4"] ?? ""), \(value["turma"] ?? "")")
            }
            
        }
        printAlunos()
        
        
        
        // criar uma funcao que calcule a media de cada aluno e imprima no console
        
        func mediaAlunos() {
            
            let aluno1: [String:Any] = ["nome":"Elder Alcantara", "idade":37, "nota1":8, "nota2":6, "nota3":7, "nota4":8, "turma":"A"]
            let aluno2: [String:Any] = ["nome":"Danilo Coelho", "idade":10, "nota1":10, "nota2":10, "nota3":10, "nota4":10, "turma":"B"]
            let aluno3: [String:Any] = ["nome":"Aline Borges", "idade":34, "nota1":9, "nota2":10, "nota3":9, "nota4":10, "turma":"C"]
            let aluno4: [String:Any] = ["nome":"Zé Mane", "idade":100, "nota1":3, "nota2":4, "nota3":4, "nota4":5, "turma":"D"]
            
            let arrayAlunos: [[String:Any]] = [aluno1, aluno2, aluno3, aluno4]
            
            var media: Int = 0
            
            for value in arrayAlunos {
                
                let n1 = value["nota1"] as! Int
                let n2 = value["nota2"] as! Int
                let n3 = value["nota3"] as! Int
                let n4 = value["nota4"] as! Int
                
                media = (n1 + n2 + n3 + n4) / 4
                    
                print("\(value["nome"] ?? ""), \(media)")
                
            }
            
            
        }
        mediaAlunos()
            
        
        
        
        
        
    }
    
}
