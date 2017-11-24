//
//  MediaItem.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation
import Unbox

enum WrapperType: String, UnboxableEnum {
    case artist = "artist"
    case collection = "collection"
}

protocol MediaItem {
    var wrapperType: WrapperType { get }
    var primaryGenreName: String? { get }
    var artistName: String { get }
    var artistId: Double { get }
    var amgArtistId: Double? { get }
}

// MARK: - Unboxable

//extension MediaItem : Unboxable {
//    init(unboxer: Unboxer) throws {
//        wrapperType = try unboxer.unbox(key: "wrapperType")
//        primaryGenreName = try unboxer.unbox(key: "primaryGenreName")
//        artistName = try unboxer.unbox(key: "artistName")
//        artistId = try unboxer.unbox(key: "artistId")
//        amgArtistId = try unboxer.unbox(key: "amgArtistId")
//    }
//}

