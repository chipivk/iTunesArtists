//
//  iTunesAPIRepositoryInterface.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

typealias CompletionBlock = (_ result: [Artist]?, _ error: Error?) -> Void
typealias AlbumsCompletionBlock = (_ result: [Album]?, _ error: Error?) -> Void

protocol iTunesAPIRepositoryInterface {
    func requestArtistList(byName name: String, completionHandler: @escaping CompletionBlock)
    func requestAlbumList(byArtistId artistId: Double, numberOfAlbums: Int?, completionHandler: @escaping AlbumsCompletionBlock)
}
