//
//  Album.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation
import Unbox

struct Album: Equatable {
    let wrapperType: WrapperType
    let primaryGenreName: String
    let artistName: String
    let artistId: Double
    let amgArtistId: Double
    
    let collectionType: String
    let collectionId: Double
    let collectionName: String
    let collectionCensoredName: String
    let artistViewUrl: URL
    let collectionViewUrl: URL
    let artworkUrl60: URL
    let artworkUrl100: URL
    let collectionPrice: Double
    let collectionExplicitness: String
    let trackCount: Int
    let copyright: String
    let country: String
    let currency: String
    let releaseDate: Date // "2013-01-01T08:00:00Z",
}

func ==(left: Album, right: Album) -> Bool {
    return left.collectionId == right.collectionId
}

// MARK: - Unboxable

extension Album : Unboxable {
    init(unboxer: Unboxer) throws {
        wrapperType = try unboxer.unbox(key: "wrapperType")
        primaryGenreName = try unboxer.unbox(key: "primaryGenreName")
        artistName = try unboxer.unbox(key: "artistName")
        artistId = try unboxer.unbox(key: "artistId")
        amgArtistId = try unboxer.unbox(key: "amgArtistId")
        
        collectionType = try unboxer.unbox(key: "collectionType")
        collectionId = try unboxer.unbox(key: "collectionId")
        collectionName = try unboxer.unbox(key: "collectionName")
        collectionCensoredName = try unboxer.unbox(key: "collectionCensoredName")
        artistViewUrl = try unboxer.unbox(key: "artistViewUrl")
        collectionViewUrl = try unboxer.unbox(key: "collectionViewUrl")
        artworkUrl60 = try unboxer.unbox(key: "artworkUrl60")
        artworkUrl100 = try unboxer.unbox(key: "artworkUrl100")
        collectionPrice = try unboxer.unbox(key: "collectionPrice")
        collectionExplicitness = try unboxer.unbox(key: "collectionExplicitness")
        trackCount = try unboxer.unbox(key: "trackCount")
        copyright = try unboxer.unbox(key: "copyright")
        country = try unboxer.unbox(key: "country")
        currency = try unboxer.unbox(key: "currency")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss'Z'"
        releaseDate = try unboxer.unbox(key: "releaseDate", formatter: dateFormatter)
    }
}
