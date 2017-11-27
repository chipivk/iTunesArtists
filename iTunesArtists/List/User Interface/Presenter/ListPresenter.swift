//
//  ListPresenter.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

class ListPresenter {
    
    var interactor: ListInteractorInput?
    weak var userInterface: ListViewInterface?
    var rootRouting: RootRouting?
    
    init() { }
    
    func convertAlbumIntoAlbumDisplayData(_ albums: [Album]) -> [AlbumDisplayData] {
        var albumItems: [AlbumDisplayData] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        for album in albums {
            albumItems.append(AlbumDisplayData(name: album.collectionName ?? "Unknow", year: dateFormatter.string(from: album.releaseDate), thumbnailURL: album.artworkUrl100))
        }
        return albumItems
    }
}

// MARK: - ListModuleInterface

extension ListPresenter : ListModuleInterface {
    
    func numberOfSections() -> Int {
        guard let interactor = interactor else {
            return 0
        }
        return interactor.numberOfSections()
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        guard let interactor = interactor else {
            return 0
        }
        return interactor.numberOfItems(inSection: section)
    }
    
    func userDidEnter(text: String?) {
        guard let text = text else {
            return
        }
        interactor?.searchArtist(withText: text)
        userInterface?.reloadTable()
    }
    
    func userDidSelectRow(atIndexPath indexPath: IndexPath) {
        guard let artist = interactor?.item(atIndexPath: indexPath) else {
            return
        }
        let albums = convertAlbumIntoAlbumDisplayData(artist.albums)
        rootRouting?.presentDetailInterface(withArtist: artist, albums: albums)
    }
    
    func setContent(toView view: ListItemViewProtocol, indexPath: IndexPath) {
        guard let item = interactor?.item(atIndexPath: indexPath) else {
            return
        }
        view.set(name: item.artistName, musicGenre: item.primaryGenreName)
        let itemAlbums = item.albums.count <= 2 ? item.albums : Array(item.albums[0..<2])
        let albums = convertAlbumIntoAlbumDisplayData(itemAlbums)
        view.addAlbums(albums)
    }
}

// MARK: - ListInteractorOutput

extension ListPresenter : ListInteractorOutput {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.userInterface?.reloadTable()
        }
    }
    
    func downloadedAlbums(atIndex index: Int) {
        DispatchQueue.main.async {
            self.userInterface?.refreshCell(atIndexPath: IndexPath(item: index, section: 0))
        }
    }
}
