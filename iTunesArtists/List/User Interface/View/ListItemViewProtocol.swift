//
//  ListItemViewProtocol.swift
//  iTunesArtists
//
//  Created by Carlos López on 24/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

protocol ListItemViewProtocol {
    func set(name: String?, musicGenre: String?)
    func addAlbums(_albums: [AlbumDisplayData])
}
