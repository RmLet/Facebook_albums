//
//  TableViewCellViewModel.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import Foundation


class TableViewCellViewModel:TableViewCellViewModelType {
    var name: String
    var image: String
    var created: String
    init(name:String, image:String, created:String) {
        self.name = name
        self.image = image
        self.created = created
    }
}
