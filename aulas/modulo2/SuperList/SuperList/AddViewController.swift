//
//  AddViewController.swift
//  SuperList
//
//  Created by Elder Alcantara on 20/08/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit


protocol AddViewControllerProtocol: class {
    
    func successAssProduto(array: [Produto])
    
}


class AddViewController: UIViewController {
    
    @IBOutlet weak var produtoTextField: UITextField!
    @IBOutlet weak var precoTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var categoriaSegmentedControl: UISegmentedControl!
   
    @IBOutlet weak var protutosTableView: UITableView!
    
    
    weak var delegate: AddViewControllerProtocol?
    
    private var listaProdutos: [Produto] = []
    private var categoriaSelected: Categoria = .alimento
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cadastrarButton.isEnabled = true
        self.protutosTableView.delegate = self
        self.protutosTableView.dataSource = self
        self.categoriaSegmentedControl.selectedSegmentIndex = -1
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tappedCadastrarButton(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.categoriaSelected = .alimento
        }else {
            self.categoriaSelected = .limpeza
        }
        print(sender.selectedSegmentIndex)
    }
    
    
    
    @IBAction func cadatrarButton(_ sender: Any) {
        
        let _produto: String = self.produtoTextField.text ?? ""
        let _preco: String = self.precoTextField.text ?? ""
        
        
        if _produto != "" && _preco != "" {
            
            self.listaProdutos.append(Produto(nome: _produto, preco: _preco, categoria: self.categoriaSelected))
            
            //            print(listaProdutos)
            
            self.produtoTextField.text = nil
            self.precoTextField.text = nil
            self.categoriaSegmentedControl.selectedSegmentIndex = 0
            
            self.delegate?.successAssProduto(array: self.listaProdutos)
            
        }
        
        self.protutosTableView.reloadData()
        print("ATUALIZAR TABLE VIEW")
    }
    
    
}



extension AddViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        cell.textLabel?.text = "Elder"
//
//        return cell
//
//    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            if section == 0 {
                return "Produtos Alimentícios"
            } else {
                return "Produtos de Limpeza"
            }
            
            //        return "section \(section)"
            
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            if section == 0 {
                return self.listaProdutos.filter({$0.categoria == .alimento}).count
            } else {
                return self.listaProdutos.filter({$0.categoria == .limpeza}).count
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            if indexPath.section == 0 {
                
                cell.textLabel?.text = self.listaProdutos.filter({$0.categoria == .alimento})[indexPath.row].nome
                cell.detailTextLabel?.text = self.listaProdutos.filter({$0.categoria == .alimento})[indexPath.row].preco
                
            } else {
                
                cell.textLabel?.text = self.listaProdutos.filter({$0.categoria == .limpeza})[indexPath.row].nome
                cell.detailTextLabel?.text = self.listaProdutos.filter({$0.categoria == .limpeza})[indexPath.row].preco
                
            }
            
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            
            print("Row \(indexPath.row) selected")
            

            let cell:UITableViewCell? = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
    //        cell?.backgroundColor = UIColor.red
            
            if cell?.accessoryType == .checkmark {
                cell?.accessoryType = .none
            }else{
                cell?.accessoryType = .checkmark
            }
        }

    
    
}


