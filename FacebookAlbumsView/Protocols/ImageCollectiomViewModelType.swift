//
//  ImageCollectiomViewModelType.swift
//  FacebookAlbumsView
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import Foundation


protocol ImageCollectiomViewModelType {
    func cellViewModel(forIndexPath IndexPath:IndexPath) -> ImageViewCellViewModelType
    func numberOfRows() -> Int
    func selectedRow(forIndexPath IndexPath:IndexPath)
}
