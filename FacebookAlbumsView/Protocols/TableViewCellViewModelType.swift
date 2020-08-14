//
//  TableViewCellViewModelType.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import Foundation

protocol TableViewCellViewModelType:class {
    var name:String {get}
    var image:String {get}
    var created:String {get}
}
