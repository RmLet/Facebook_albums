//
//  FacebookResponse.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

struct Album:Decodable {
    var data:[AlbumsData]
}

struct AlbumPhotoData:Decodable {
    var data:[AlbumPhotoDataItem]
}

struct AlbumPhotoDataItem:Decodable {
    var picture:String
    var id:String
    var created_time:String
}

struct PictrureInfo:Decodable {
    var is_silhouette:String
    var url:String
}

struct AlbumPicture:Decodable {
    var data:PictrureInfo
}

struct AlbumsData:Decodable {
    var id:String
    var created_time:String
    var name:String
    var photos:AlbumPhotoData
}

struct FacebookResponse:Decodable {
    var id:String
    var name:String
    var albums:Album
}



