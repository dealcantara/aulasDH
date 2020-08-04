//
//  ViewController.swift
//  Animais
//
//  Created by Elder Alcantara on 03/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var cat1: Animal = Cat(name: "gato1", color: "preto")
        print(cat1.sendSound())
        cat1.eat()
        
        var cow1: Animal = Cow(name: "vaca1", color: "branco", literMilk: 4)
        print(cow1.sendSound())
        cow1.eat()
        
    }


}


class Cat:Animal {
    
    override init(name: String?, color: String?) {
        super.init(name: name, color: color)
    }
    
//    func miar() -> String?{
//        return "Miaaau"
//    }
//
//    func eatFish(){
//        print("Devorando um peixe")
//    }
    
    override func sendSound() -> String {
        return "Miaaau"
    }
    
    override func eat() {
        print("Devorando um peixe")
    }
    
}

class Cow:Animal {
    
    var literMilk: Int?
    
     init(name: String?, color: String?, literMilk: Int? ) {
           super.init(name: name, color: color)
           self.literMilk = literMilk
       }
    
//    func mugir() -> String?{
//        return "Muuu"
//    }
//
//    func eatGrass(){
//        print("Devorando um capim")
//    }
    
    override func sendSound() -> String {
        return "Muuu"
    }
    
    override func eat() {
        print("Devorando um capim")
    }
    
}


class Animal {
    var name: String?
    var color: String?
    
    init(name: String?, color: String?) {
        self.name = name
        self.color = color
    }
    
    func sendSound() -> String {
        return "O animal está emitindo um som"
    }
    
    func eat() {
        print("O animal está comendo")
    }
}
