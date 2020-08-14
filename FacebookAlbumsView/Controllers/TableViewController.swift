//
//  TableViewController.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    public var viewModel:TableViewViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell else {return UITableViewCell()}
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }


    
    override func tableView(_ tableView:UITableView, didSelectRowAt indexPath:IndexPath) {
        self.viewModel.selectedRow(forIndexPath: indexPath)
        print("selected row at \(indexPath.row)")
        let viewModel = self.viewModel.viewModelForSelectedRow()
        performSegue(withIdentifier: "ImageCollectionViewContoller", sender: viewModel)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "ImageCollectionViewContoller" {
            if let imageCollectionViewContoller = segue.destination as? ImageColectionViewController {
                if let model = sender as? ImageCellectionViewModel{
                    imageCollectionViewContoller.viewModel = model
                }
            }
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
}
