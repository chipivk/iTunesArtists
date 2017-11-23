//
//  ITunesArtistsAPIResult.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation
import Unbox

struct ITunesArtistsAPIResult {
    let resultCount: Int
    let results: [Artist]
}

// MARK: - Unboxable

extension ITunesArtistsAPIResult : Unboxable {
    init(unboxer: Unboxer) throws {
        resultCount = try unboxer.unbox(key: "resultCount")
        results = try unboxer.unbox(key: "results")
    }
}

//// MARK: Encode and Decode methods
//
//extension ITunesAPIResult {
//
//    class Coding: NSObject, NSCoding {
//        let item: ITunesAPIResult?
//
//        init(item: ITunesAPIResult) {
//            self.item = item
//            super.init()
//        }
//
//        required init?(coder aDecoder: NSCoder) {
//            guard let resultCount = aDecoder.decodeObject(forKey: "resultCount") as? Int,
//                let results = aDecoder.decodeObject(forKey: "results") as? [MediaItem.Coding]? else {
//                    return nil
//            }
//
//            item = ITunesAPIResult(resultCount: resultCount, results: results)
//
//            super.init()
//        }
//
//        public func encode(with aCoder: NSCoder) {
//            guard let item = item else {
//                return
//            }
//            aCoder.encode(item.resultCount, forKey:"resultCount")
//            aCoder.encode(item.results, forKey:"results")
//        }
//    }
//}
//
//
//extension ITunesAPIResult: Encodable {
//    var encoded: Decodable? {
//        return ITunesAPIResult.Coding(newsListItem: self)
//    }
//}
//
//extension ITunesAPIResult.Coding: Decodable {
//    var decoded: Encodable? {
//        return self.item
//    }
//}

