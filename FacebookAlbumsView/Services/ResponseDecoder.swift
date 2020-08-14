//
//  ResponseDecoder.swift
//  FacebookAlbums
//
//  Created by отмеченные on 14.08.2020.
//  Copyright © 2020 отмеченные. All rights reserved.
//

import Foundation

class ResponseDecoder {
    static func decode_json(_ data:NSDictionary) -> FacebookResponse? {
        do {
            let data = try JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(FacebookResponse.self, from: data as Data)
            return jsonData
        } catch {
            return nil
        }
    }
}

