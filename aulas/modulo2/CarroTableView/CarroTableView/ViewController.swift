//
//  ViewController.swift
//  CarroTableView
//
//  Created by Felipe Miranda on 03/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

struct Carro {
    
    var modelo: String?
    var ano: String?
    var km: Float?
    var cor: String?
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var arrayCarros:[Carro] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let carro2: Carro = Carro(modelo: "Palio", ano: "2009", km: 30000, cor: "Azul")
        let carro3: Carro = Carro(modelo: "Focus", ano: "2014", km: 30000, cor: "Preto")
        let carro4: Carro = Carro(modelo: "Focus", ano: "2019", km: 30000, cor: "Preto")
        let carro5: Carro = Carro(modelo: "Civic", ano: "2016", km: 30000, cor: "Preto")
        let carro1: Carro = Carro(modelo: "Civic", ano: "2019", km: 30000, cor: "Preto")
        

        self.myTableView.register(UINib(nibName: "CarroCell", bundle: nil), forCellReuseIdentifier: "CarroCell")
        
        
        self.arrayCarros = [carro1,carro2,carro3,carro4,carro5]
        
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayCarros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        cell.textLabel?.text = self.arrayCarros[indexPath.row].modelo
//        cell.detailTextLabel?.text = self.arrayCarros[indexPath.row].ano
        
        
        let cell: CarroCell? = tableView.dequeueReusableCell(withIdentifier: "CarroCell", for: indexPath) as? CarroCell
        
        cell?.setupCell(carro: self.arrayCarros[indexPath.row])
        
        
        return cell ?? UITableViewCell()
        
    }
    
    
    
}
