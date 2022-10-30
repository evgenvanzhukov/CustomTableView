//
//  Protocols.swift
//  CustomTableView
//
//  Created by Evgen on 30/10/2022.
//  Copyright © 2022 Evgen. All rights reserved.
//

import Foundation
import UIKit

protocol CellDelegate : AnyObject {
    func cellPressed(for cell: CustomCell)
}

protocol DetailsDelegate : AnyObject {
    func saveDetails( _ model: Model)
}
