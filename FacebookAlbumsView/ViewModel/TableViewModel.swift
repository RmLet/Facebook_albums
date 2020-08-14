//
//  TableViewModel.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import Foundation


class TableViewModel:TableViewViewModelType {
 
    
    private var model:FacebookResponse
    private var selectedIndexPath:IndexPath?
    
    init(model:FacebookResponse) {
        self.model = model
    }
    
    
    func cellViewModel(forIndexPath IndexPath: IndexPath) -> TableViewCellViewModelType {
        let album_profile = self.model.albums.data[IndexPath.row]
        return TableViewCellViewModel(name: album_profile.name, image: album_profile.photos.data[0].picture, created: album_profile.created_time)
    }
    
    func numberOfRows() -> Int {
        return self.model.albums.data.count
    }
    
    func viewModelForSelectedRow() -> ImageCollectiomViewModelType? {
        guard let selectedIndex = selectedIndexPath else {return nil}
        let viewModel = ImageCellectionViewModel(model: self.model.albums.data[selectedIndex.row].photos)
        return viewModel
    }
    
    func selectedRow(forIndexPath IndexPath: IndexPath) {
        self.selectedIndexPath = IndexPath
    }
    
    
}
