//
//  ViewController.swift
//  TableView
//
//  Created by Fernando Douglas Vieira on 23/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = [Pessoa2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let adulto = Adulto(nome: "Gilberto", foto: "adulto.jpg", idade: 45, profissao: "iOS Developer")
        let crianca = Crianca(nome: "Danilo", foto: "crianca.jpeg", brinquedo: "iPad", altura: 1.20)
        
        dataSource.append(adulto)
        dataSource.append(crianca)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "adulto" {
            if let viewController = segue.destination as? AdultoViewController {
                if let pessoa = sender as? Adulto {
                    viewController.pessoa = pessoa
                }
            }
        }
        
        if segue.identifier == "crianca" {
            if let viewController = segue.destination as? CriancaViewController {
                if let pessoa = sender as? Crianca {
                    viewController.pessoa = pessoa
                }
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pessoaCell", for: indexPath) as? PessoaTableViewCell
        
        cell?.pessoa = dataSource[indexPath.row]
        cell?.setup()
        
        return cell ?? UITableViewCell()
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pessoa = dataSource[indexPath.row]
        
        if pessoa is Adulto {
            performSegue(withIdentifier: "adulto", sender: pessoa)
        } else if pessoa is Crianca {
            performSegue(withIdentifier: "crianca", sender: pessoa)
        }
    }
}
