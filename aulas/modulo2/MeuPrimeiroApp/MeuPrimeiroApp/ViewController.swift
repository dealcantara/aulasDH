//
//  ViewController.swift
//  MeuPrimeiroApp
//
//  Created by Elder Alcantara on 03/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    // modelo, ano, cor, km (5 carros)
    @IBOutlet weak var listCarsTableView: UITableView!
    
    private var listaCarros: [Carro] = []
    
    
    var arrayCarros:[Carro] = [
        Carro(modelo: "Fiat Argo", ano: 2018, cor: "Vermelho", km: 42000),
        Carro(modelo: "Fiat Uno", ano: 2000, cor: "Preto", km: 100000),
        Carro(modelo: "Fiat Argo", ano: 2018, cor: "Vermelho", km: 42000),
        Carro(modelo: "Fiat Strada", ano: 2020, cor: "Azul", km: 42000),
        Carro(modelo: "Fiat Argo", ano: 2020, cor: "Prata", km: 0), ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.listCarsTableView.register(UINib(nibName: "CarroCellTableViewCell", bundle: nil), forCellReuseIdentifier: "CarroCell")
        self.listCarsTableView.delegate = self
        self.listCarsTableView.dataSource = self
        
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
        //        cell.detailTextLabel?.text = String( self.arrayCarros[indexPath.row].ano)
        
        let cell: CarroCellTableViewCell?  = tableView.dequeueReusableCell(withIdentifier: "CarroCell", for: indexPath) as? CarroCellTableViewCell
        
        cell?.setupCell(carro: self.arrayCarros[indexPath.row])
        return cell ?? UITableViewCell()
        
    }
    
    
    
    
    
    
    
    
}

