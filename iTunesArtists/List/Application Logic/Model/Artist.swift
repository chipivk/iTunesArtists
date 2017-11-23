//
//  Artist.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation
import Unbox

struct Artist: MediaItem, Equatable {
    let wrapperType: WrapperType
    let primaryGenreName: String
    let artistName: String
    let artistId: Int
    let amgArtistId: Int
    
    let artistType: String
    let artistLinkUrl: URL
    let primaryGenreId: String
}

func ==(left: Artist, right: Artist) -> Bool {
    return left.artistId == right.artistId
}

// MARK: - Unboxable

extension Artist : Unboxable {
    init(unboxer: Unboxer) throws {
        wrapperType = try unboxer.unbox(key: "wrapperType")
        primaryGenreName = try unboxer.unbox(key: "primaryGenreName")
        artistName = try unboxer.unbox(key: "artistName")
        artistId = try unboxer.unbox(key: "artistId")
        amgArtistId = try unboxer.unbox(key: "amgArtistId")
        
        artistType = try unboxer.unbox(key: "artistType")
        artistLinkUrl = try unboxer.unbox(key: "artistId")
        primaryGenreId = try unboxer.unbox(key: "primaryGenreId")
    }
}
