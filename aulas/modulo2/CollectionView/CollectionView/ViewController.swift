//
//  ViewController.swift
//  CollectionView
//
//  Created by Felipe Miranda on 08/09/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var arrayCarros:[Carro] = []
    var arrayMotos:[Moto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.arrayCarros = [Carro(modelo: "brasilia", ano: "1980", image: "brasilia.jpg"),
                            Carro(modelo: "fusca", ano: "1970", image: "fusca.jpg"),
                            Carro(modelo: "marea", ano: "1990", image: "marea.jpg"),
                            Carro(modelo: "passat", ano: "1980", image: "passat.jpg")]
        
        self.arrayMotos = [Moto(modelo: "R1", ano: "2005", image: "R1.jpg", cilindradas: "900"),
        Moto(modelo: "Harley", ano: "1970", image: "harley.jpg",cilindradas: "600")]
        
        
        
        self.myCollectionView.register(UINib(nibName: "CarrosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarrosCollectionViewCell")
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview: SectionHeader?
        
        if kind == UICollectionView.elementKindSectionHeader {
            reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader

            if indexPath.section == 0 {
                reusableview?.backgroundColor = .blue
                reusableview?.titleLabel.text = "Carros"
            }else {
                reusableview?.backgroundColor = .green
                reusableview?.titleLabel.text = "Motos"

            }
        
        }

        return reusableview ?? UICollectionReusableView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return self.arrayCarros.count
        case 1:
            return self.arrayMotos.count
        default:break
        }

        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell: CarrosCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CarrosCollectionViewCell", for: indexPath) as? CarrosCollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell?.setupCellCarro(carro: self.arrayCarros[indexPath.item])
        case 1:
            cell?.setupCellMoto(moto: self.arrayMotos[indexPath.item])
        default: break
        }

        return cell ?? UICollectionViewCell()
        
    }
    
}
