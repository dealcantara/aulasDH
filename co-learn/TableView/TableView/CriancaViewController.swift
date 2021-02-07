//
//  CriancaViewController.swift
//  TableView
//
//  Created by Fernando Douglas Vieira on 23/11/2020.
//

import UIKit

class CriancaViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var alturaLabel: UILabel!
    @IBOutlet weak var brinquedoLabel: UILabel!
    
    var pessoa: Crianca?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        imageView.image = UIImage(named: pessoa!.foto)
        nomeLabel.text = pessoa?.nome
        alturaLabel.text = pessoa?.altura.description
        brinquedoLabel.text = pessoa?.brinquedo
        
    }

}
