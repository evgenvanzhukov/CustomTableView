//
//  CustomCell.swift
//  CustomTableView
//
//  Created by Evgen on 29/10/2022.
//  Copyright © 2022 Evgen. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name3: UILabel!
    
    @IBOutlet weak var value1: UILabel!
    @IBOutlet weak var value2: UILabel!
    @IBOutlet weak var value3: UILabel!
    
    @IBOutlet weak var units1: UILabel!
    @IBOutlet weak var units2: UILabel!
    @IBOutlet weak var units3: UILabel!
    
    weak var delegate : CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        delegate?.cellPressed(for: self)
    }
    
    func configure(with model: Model, _ delegate: CellDelegate?) {
        self.delegate = delegate
        name1.text = model.gas.name
        name2.text = model.electricity.name
        name3.text = model.water.name
        
        value1.text = "\(model.gas.value)"
        value2.text = "\(model.electricity.value)"
        value3.text = "\(model.water.value)"
        
        units1.text = model.gas.units
        units2.text = model.electricity.units
        units3.text = model.water.units
    }

}

extension UITableViewCell {
    
    static func cellId() -> String {
        return String(describing: self)
    }
}
