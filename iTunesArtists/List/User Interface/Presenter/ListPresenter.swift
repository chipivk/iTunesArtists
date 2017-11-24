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
    
    init() {
        
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
    
    func didSelectRow(atIndexPath indexPath: IndexPath) {
        
    }
    
    func setContent(toView view: ListItemViewProtocol, indexPath: IndexPath) {
        guard let item = interactor?.item(atIndexPath: indexPath) else {
            return
        }
        var albums: [AlbumDisplayData] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        for album in item.albums {
            albums.append(AlbumDisplayData(name: album.collectionName ?? "Unknow", year: dateFormatter.string(from: album.releaseDate), thumbnailURL: album.artworkUrl60))
        }
        view.set(name: item.artistName, musicGenre: item.primaryGenreName)
        view.addAlbums(albums)
    }
}

// MARK: - ListInteractorOutput

extension ListPresenter : ListInteractorOutput {
    
    func reloadData() {
        userInterface?.reloadTable()
    }
}
