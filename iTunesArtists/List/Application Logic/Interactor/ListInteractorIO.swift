//
//  ListInteractorIO.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

protocol ListInteractorInput: class {
    func searchArtist(withText text: String)
    func searchAlbums(byArtistId artistId: Double, numberOfAlbums: Int)
    func numberOfSections() -> Int
    func numberOfItems(inSection section: Int) -> Int
    func item(atIndexPath indexPath: IndexPath) -> Artist
}

protocol ListInteractorOutput: class {
    func reloadData()
}
