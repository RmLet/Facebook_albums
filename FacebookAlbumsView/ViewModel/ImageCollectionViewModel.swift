//
//  ImageCollectionViewModel.swift
//  FacebookAlbumsView
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import Foundation


class ImageCellectionViewModel:ImageCollectiomViewModelType {
    
    private var model:AlbumPhotoData!
    private var selectedIndexPath:IndexPath?
    
    
    init(model:AlbumPhotoData) {
        self.model = model
    }
    
    func cellViewModel(forIndexPath IndexPath: IndexPath) -> ImageViewCellViewModelType {
        return ImageViewCellViewModel(image: self.model.data[IndexPath.row].picture)
    }
    
    func numberOfRows() -> Int {
        return self.model.data.count
    }
    
    
    func selectedRow(forIndexPath IndexPath: IndexPath) {
        self.selectedIndexPath = IndexPath
    }
}
