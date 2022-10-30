//
//  ViewController.swift
//  CustomTableView
//
//  Created by Evgen on 29/10/2022.
//  Copyright © 2022 Evgen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellDelegate, DetailsDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var modelList: [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelList = DataService.getData()
        
        let nib = UINib(nibName: "TableCell", bundle: nil)

        tableView.register(nib, forCellReuseIdentifier: CustomCell.cellId())
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId(), for: indexPath)
        as! CustomCell
        
        let model = modelList[indexPath.row]
        cell.configure(with: model, self)
        tableView.deselectRow(at: indexPath, animated: false)
        return cell
    }
    
    func cellPressed(for cell: CustomCell) {

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = modelList[indexPath.row]
        performSegue(withIdentifier: "segueId", sender: model)

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueId", let model = sender as? Model {
            let destinationController = segue.destination as! DetailViewController
            destinationController.model = model
            destinationController.delegate = self
        }
    }
    
    func saveDetails(_ model: Model) {
        
        guard let elementInArray = modelList.enumerated().first(where: {$0.element.month == model.month}) else {
            return
        }
        
        modelList.remove(at: elementInArray.offset)
        modelList.insert(model, at: elementInArray.offset)
        
        tableView.reloadData()
    }
    
}

