//
//  FAcebookAlbumsRequest.swift
//  AlbumsProfile
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 kirill. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookAlbumsRequest {
    static func return_data(callback:@escaping (_ result: FacebookResponse?)->()) {
        let connection = GraphRequestConnection()
        let request = GraphRequest(graphPath: "/me", parameters: ["fields":"id,name,albums{photos{picture,likes,created_time},created_time,name, picture}"],httpMethod:HTTPMethod("GET"))
        connection.add(request, completionHandler: {  httpResponse, result, error   in
            if error != nil {
                callback(nil)
            }
            guard let result_ = result as? NSDictionary else {return}
            guard let decodedData = ResponseDecoder.decode_json(result_) else {return}
            callback(decodedData)
        })
        connection.start()
    }
}
