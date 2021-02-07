//
//  DespesaVC.swift
//  MyBank
//
//  Created by Elder Alcantara on 03/11/20.
//

import UIKit

class ExtratoVC: UIViewController {
    
    @IBOutlet weak var timelineTableView: UITableView!
    
    private var viewModel: ExtratoVM?
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.viewModel = ExtratoVM()
        self.viewModel?.loadExtrato()
        self.timelineTableView.register(UINib(nibName: "ExtratoCell", bundle: nil), forCellReuseIdentifier: "ExtratoCell")
        
        self.timelineTableView.delegate = self
        self.timelineTableView.dataSource = self
        self.timelineTableView.separatorStyle = .none

    }

    
}

extension ExtratoVC: UITableViewDelegate, UITableViewDataSource {
    
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
