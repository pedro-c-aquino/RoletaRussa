//
//  ImportArquivoJSON.swift
//  RoletaRussa
//
//  Created by user208023 on 7/7/22.
//

import Foundation

func readLocalJSONFile(forName name: String) -> Data? {
    
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileURL = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileURL)
            return data
        }
    } catch {
        print("erro: \(error)")
    }
    return nil
}

func parse(jsonData: Data) -> DataRecord? {
    do {
        let decodedData = try JSONDecoder().decode(DataRecord.self, from: jsonData)
        return decodedData
    } catch {
        print("erro: \(error)")
    }
    return nil
}
