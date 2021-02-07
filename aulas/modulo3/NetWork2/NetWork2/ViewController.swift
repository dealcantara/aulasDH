//
//  ViewController.swift
//  NetWork2
//
//  Created by Elder Alcantara on 01/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session: URLSession = URLSession.shared
        let url: URL? = URL(string: "http://www.amock.io/api/invoice")
        
        if let _url = url {
            
            let task: URLSessionTask = session.dataTask(with: _url) { (data, response, error) in
                
                print(response)
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data ?? Data(), options: [])
                    print(json)
                    
                } catch {
                    
                    print(error)
                    
                }
                
            }
            
            task.resume()
            
        }
        // Do any additional setup after loading the view.
    }


}

