//
//  AccountBalanceVC.swift
//  MyBank
//
//  Created by Felipe Miranda on 03/11/20.
//

import UIKit

class AccountBalanceVC: BaseViewController {

    @IBOutlet weak var timeLineTableView: UITableView!
    
    private var viewModel: ExtratoVM?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLoading()

        self.viewModel = ExtratoVM()
        
        self.timeLineTableView.register(UINib(nibName: "ExtratoCell", bundle: nil), forCellReuseIdentifier: "ExtratoCell")
        
        
        self.viewModel?.loadExtrato(completion: { (success, error) in
            
            if success {
                
                DispatchQueue.main.async {
                    self.timeLineTableView.delegate = self
                    self.timeLineTableView.dataSource = self
                    self.timeLineTableView.separatorStyle = .none
                    self.timeLineTableView.reloadData()
                    self.hiddenLoading()
                }
                
            } else {
                
                print(error ?? "")
                
            }
            
        })
        
        // Do any additional setup after loading the view.
    }

}

extension AccountBalanceVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ExtratoCell? = tableView.dequeueReusableCell(withIdentifier: "ExtratoCell", for: indexPath) as? ExtratoCell
        self.viewModel?.loadCurrentLancamentoElement(index: indexPath)
        cell?.setup(value: self.viewModel)
        
        return cell ?? UITableViewCell()
    }
}

