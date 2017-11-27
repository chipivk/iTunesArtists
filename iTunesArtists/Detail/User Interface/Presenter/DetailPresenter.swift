//
//  DetailPresenter.swift
//  iTunesArtists
//
//  Created by Carlos López on 27/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

class DetailPresenter {
    
    private let artist: Artist
    private let albums: [AlbumDisplayData]
    
    var interactor: DetailInteractorInput?
    weak var userInterface: DetailViewInterface?
    var rootRouting: RootRouting?
    
    init(artist: Artist, albums: [AlbumDisplayData]) {
        self.artist = artist
        self.albums = albums
    }
}

// MARK: - DetailModuleInterface

extension DetailPresenter : DetailModuleInterface {
    
    func viewDidLoad() {
        userInterface?.set(title: artist.artistName)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return albums.count
    }
    
    func didSelectRow(atIndexPath indexPath: IndexPath) {
        
    }
    
    func setContent(toView view: AlbumItemViewProtocol, indexPath: IndexPath) {
        let album = albums[indexPath.row]
        view.set(collectionName: album.name, year: album.year, thumbnailImageURL: album.thumbnailURL)
    }
}

// MARK: - DetailInteractorOutput

extension DetailPresenter : DetailInteractorOutput {
    
}
