//
//  DetailViewController.swift
//  CustomTableView
//
//  Created by Evgen on 30/10/2022.
//  Copyright © 2022 Evgen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBAction func saveBtnPressed(_ sender: Any) {
        saveModel()
    }
    
    @IBOutlet weak var gasUnitField: UITextField!
    @IBOutlet weak var gasValueField: UITextField!
    @IBOutlet weak var gasNameField: UITextField!
    
    @IBOutlet weak var electroNameField: UITextField!
    @IBOutlet weak var electroValueField: UITextField!
    @IBOutlet weak var electroUnitField: UITextField!
    
    @IBOutlet weak var waterNameField: UITextField!
    @IBOutlet weak var waterValueField: UITextField!
    @IBOutlet weak var waterUnitsField: UITextField!
    
    var model: Model?
    weak var delegate: DetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    

    func configure() {
        guard let model = model else {
            return
        }
        
        gasNameField.text = model.gas.name
        gasValueField.text = "\(model.gas.value)"
        gasUnitField.text = model.gas.units
        
        waterNameField.text = model.water.name
        waterValueField.text = "\(model.water.value)"
        waterUnitsField.text = model.water.units
        
        electroNameField.text = model.electricity.name
        electroValueField.text = "\(model.electricity.value)"
        electroUnitField.text = model.electricity.units
    }
    
    func saveModel() {
        if  let gasValue = Decimal(string: gasValueField?.text ?? "0"),
            let waterValue = Decimal(string: waterValueField.text ?? "0"),
            let electoValue = Decimal(string: electroValueField.text ?? "0") {
            
                let gas = Element(gasNameField.text ?? "-",gasValue, gasUnitField.text ?? "-")
                let electro = Element(electroNameField.text ?? "-", electoValue, electroUnitField.text ?? "-")
                let water = Element(waterNameField.text ?? "-", waterValue, waterUnitsField.text ?? "-")
                
                var newModel = Model(gas: gas, electricity: electro, water: water, month: model!.month)
                
                self.delegate?.saveDetails(newModel)
                
                self.navigationController?.popViewController(animated: false)
            
        }
    }
}
