//
//  HistoricoViewController.swift
//  RoletaRussa
//
//  Created by user208023 on 7/7/22.
//

import UIKit

class HistoricoViewController: UIViewController {
    
    @IBOutlet weak var historicoTableView: UITableView!
    @IBOutlet weak var valueLabel: UILabel!
    
    let historicoController: HistoricoController = HistoricoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historicoController.importaData()
        
        historicoTableView.delegate = self
        historicoTableView.dataSource = self
        
        historicoTableView.register(UINib(nibName: "HistoricoTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoricoTableViewCell")
        
        self.valueLabel.text = String(format: "%.2f", historicoController.valor)
    }
}

extension HistoricoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historicoController.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellHistorico: HistoricoTableViewCell? = historicoTableView.dequeueReusableCell(withIdentifier: "HistoricoTableViewCell", for: indexPath) as? HistoricoTableViewCell
        
        cellHistorico?.setup(value: historicoController.loadCurrentProduct(indexPath: indexPath), imageType: historicoController.getTipo(indexPath: indexPath))
        
        return cellHistorico ?? UITableViewCell()
    }
    
    
}
