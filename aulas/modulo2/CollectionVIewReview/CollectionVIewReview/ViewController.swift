//
//  ViewController.swift
//  CollectionVIewReview
//
//  Created by Elder Alcantara on 14/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var arrayCarros:[Carro] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        self.arrayCarros = [Carro(modelo: "Brasília", ano: "1980", imagem: "brasilia.jpg"),
        Carro(modelo: "Fusca", ano: "1970", imagem: "fusca.jpg"),
        Carro(modelo: "Marea", ano: "1990", imagem: "marea.jpg"),
        Carro(modelo: "Passat", ano: "1980", imagem: "passat.jpg"), ]
        
        self.myCollectionView.register(UINib(nibName: "CarrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarrosCollectionViewCell")
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrayCarros.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CarrosCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CarrosCollectionViewCell", for: indexPath) as? CarrosCollectionViewCell
        
        cell?.setupCell(carro: self.arrayCarros[indexPath.row])
        
        return cell ?? UICollectionViewCell()
         
    }
    
    
}
