//
//  Album.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation
import Unbox

struct Album: MediaItem, Equatable {
    
    let wrapperType: WrapperType
    let primaryGenreName: String?
    let artistName: String
    let artistId: Double
    let amgArtistId: Double?
    
    let collectionType: String?
    let collectionId: Double?
    let collectionName: String?
    let collectionCensoredName: String
    let artistViewUrl: URL?
    let collectionViewUrl: URL
    let artworkUrl60: URL
    let artworkUrl100: URL
    let collectionPrice: Double?
    let collectionExplicitness: String
    let trackCount: Int
    let copyright: String?
    let country: String
    let currency: String
    let releaseDate: Date // "2013-01-01T08:00:00Z"
}

func ==(left: Album, right: Album) -> Bool {
    return left.collectionId == right.collectionId
}

// MARK: - UnboxableByTransform

extension Album : UnboxableByTransform {
    public typealias UnboxRawValue = [String : Any]
    
    
    public static func transform(unboxedValue: UnboxRawValue) -> Album? {
        let wrapperType = unboxedValue["wrapperType"] as? String
        if let wrapperType = wrapperType, wrapperType == "artist" {
            return nil
        }
        let primaryGenreName = unboxedValue["primaryGenreName"] as! String
        let artistName = unboxedValue["artistName"] as! String
        let artistId = unboxedValue["artistId"] as! Double
        let amgArtistId = unboxedValue["amgArtistId"] as? Double
        let collectionType = unboxedValue["collectionType"] as? String
        let collectionId = unboxedValue["collectionId"] as? Double
        let collectionName = unboxedValue["collectionName"] as? String
        let collectionCensoredName = unboxedValue["collectionCensoredName"] as! String
        var artistViewUrl: URL?
        if let artistViewUrlString = unboxedValue["artistViewUrl"] as? String {
            artistViewUrl = URL(string: artistViewUrlString)!
        }
        
        let collectionViewUrl = URL(string: unboxedValue["collectionViewUrl"] as! String)!
        let artworkUrl60 = URL(string: unboxedValue["artworkUrl60"] as! String)!
        let artworkUrl100 = URL(string: unboxedValue["artworkUrl100"] as! String)!
        let collectionPrice = unboxedValue["collectionPrice"] as? Double
        let collectionExplicitness = unboxedValue["collectionExplicitness"] as! String
        let trackCount = unboxedValue["trackCount"] as! Int
        let copyright = unboxedValue["copyright"] as? String
        let country = unboxedValue["country"] as! String
        let currency = unboxedValue["currency"] as! String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss'Z'"
        let releaseDate = dateFormatter.date(from: unboxedValue["releaseDate"] as! String)!
        
        return Album(wrapperType: .collection, primaryGenreName: primaryGenreName, artistName: artistName, artistId: artistId, amgArtistId: amgArtistId, collectionType: collectionType, collectionId: collectionId, collectionName: collectionName, collectionCensoredName: collectionCensoredName, artistViewUrl: artistViewUrl, collectionViewUrl: collectionViewUrl, artworkUrl60: artworkUrl60, artworkUrl100: artworkUrl100, collectionPrice: collectionPrice, collectionExplicitness: collectionExplicitness, trackCount: trackCount, copyright: copyright, country: country, currency: currency, releaseDate: releaseDate)
    }
}
