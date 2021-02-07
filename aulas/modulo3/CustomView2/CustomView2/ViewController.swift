//
//  ViewController.swift
//  CustomView2
//
//  Created by Elder Alcantara on 19/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = CustomView(frame: CGRect(x: 10, y: 50, width: 300, height: 300))
        
        view.backgroundColor = .black
        //view.layer.cornerRadius = 150
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.red.cgColor
        view.center = self.view.center
        view.cicle = true
        
        self.view.addSubview(view)
        
    }


}

