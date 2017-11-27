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
