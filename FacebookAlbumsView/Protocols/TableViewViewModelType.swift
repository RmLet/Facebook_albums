//
//  TableViewViewModelType.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {
    func cellViewModel(forIndexPath IndexPath:IndexPath) -> TableViewCellViewModelType
    func numberOfRows() -> Int
    func viewModelForSelectedRow() -> ImageCollectiomViewModelType?
    func selectedRow(forIndexPath IndexPath:IndexPath)
}
