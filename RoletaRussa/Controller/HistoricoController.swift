//
//  HistoricoController.swift
//  RoletaRussa
//
//  Created by user208023 on 7/7/22.
//

import Foundation

class HistoricoController {
    
    private var dadosJSON: DataRecord?
    
    let historicoController: Controller = Controller()
    
    var count: Int {
        return dadosJSON?.productList.count ?? 0
    }
    
    var valor: Double {
        return dadosJSON?.totalValue ?? 0.0
    }
    
    func importaData() {
        let jsonData = readLocalJSONFile(forName: "JSONData")
        
        if let data = jsonData {
            if let recordObj = parse(jsonData: data) {
                dadosJSON = recordObj
            }
        }
    }
    
    func loadCurrentProduct(indexPath: IndexPath) -> Product? {
        
        return self.dadosJSON?.productList[indexPath.row]
    }
    
    func getTipo(indexPath: IndexPath) -> String {
        
        if self.dadosJSON?.productList[indexPath.row].productType == "BEBIDA" {
            return "beer"
        } else {
            return "dish"
        }
    }
}
