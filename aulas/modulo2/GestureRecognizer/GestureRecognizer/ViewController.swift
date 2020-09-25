//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Elder Alcantara on 24/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewOrange: UIView!
    @IBOutlet weak var viewPurple: UIView!
    @IBOutlet weak var viewGreen: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapped(sender: )))
//        tap.numberOfTapsRequired = 2
        viewOrange.addGestureRecognizer(tap)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwiped(sender: )))
        swipe.direction = .right
        viewPurple.addGestureRecognizer(swipe)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(sender: )))
        longPress.minimumPressDuration = 3.0
        viewGreen.addGestureRecognizer(longPress)

    }

    
    @objc func didTapped(sender: UITapGestureRecognizer){
        print("viewDidTapped")
        sender.view?.backgroundColor = .blue
    }
    
    
    @objc func didSwiped(sender: UITapGestureRecognizer){
        print("viewDidSwiped")
        sender.view?.backgroundColor = .brown
    }
    
    
    @objc func longPress(sender: UITapGestureRecognizer){
        print("viewLongPress")
        sender.view?.backgroundColor = .gray
    }
    
    
}

