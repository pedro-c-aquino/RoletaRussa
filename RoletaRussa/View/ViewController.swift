//
//  ViewController.swift
//  RoletaRussa
//
//  Created by user208023 on 7/7/22.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func enableDrawButton(counter: Int)
    func createAlert()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var spinRouletteButton: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    
    private let controller = Controller()
    
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        self.nameTextField.delegate = self
        
        self.myTableView.register(UINib(nibName: "EmptyCustomCell", bundle: nil), forCellReuseIdentifier: "EmptyCustomCell")
        self.myTableView.register(UINib(nibName: "CustomCellNames", bundle: nil), forCellReuseIdentifier: "CustomCellNames")
    }
    
    @IBAction func spinRouletteButton(_ sender: UIButton) {
        controller.drawPerson()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.delegate = self
        self.delegate?.enableDrawButton(counter: Int(controller.count))
        return controller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if controller.arrayIsEmpty() {
            let emptyCell: EmptyCustomCell? = myTableView.dequeueReusableCell(withIdentifier: "EmptyCustomCell", for: indexPath) as? EmptyCustomCell
            myTableView.isScrollEnabled = false
            emptyCell?.isUserInteractionEnabled = false
            return emptyCell ?? UITableViewCell()
        } else {
            myTableView.isScrollEnabled = true
            let cellNames: CustomCellNames? = myTableView.dequeueReusableCell(withIdentifier: "CustomCellNames", for: indexPath) as? CustomCellNames
            cellNames?.setup(value: self.controller.loadCurrentPerson(indexPath: indexPath))
            return cellNames ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if controller.validateDrawPerson(indexPath: indexPath) {
            self.myTableView.reloadData()
        } else {
            self.delegate = self
            delegate?.createAlert()
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        controller.addPerson(value: nameTextField.text ?? "")
        
        self.myTableView.reloadData()
        self.nameTextField.text = ""
        nameTextField.resignFirstResponder()
        
        return true
    }
}
