//
//  ListInteractor.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

class ListInteractor {
    var repository: iTunesAPIRepositoryInterface?
    var output: ListInteractorOutput?
    
    var artists: [Artist]?
    
    var artistsAndAlbums: [MediaItem]?
    
    init() {
    }
}

// MARK: - ListInteractorInput

extension ListInteractor : ListInteractorInput {
    func searchArtist(withText text: String) {
        repository?.requestArtistList(byName: text, completionHandler: { (artistList, error) in
            guard let artistList = artistList else {
                print("Error: \(error)")
                return
            }
            print("Artists: \(artistList)")
            self.artists = artistList
            self.artistsAndAlbums = artistList
            
            for artist in artistList {
                self.searchAlbums(byArtistId: artist.artistId)
            }
//            output.
        })
    }
    
    func searchAlbums(byArtistId artistId: Double, numberOfAlbums: Int = 2) {
        repository?.requestAlbumList(byArtistId: artistId, numberOfAlbums: numberOfAlbums, completionHandler: { (albums, error) in
            guard let albums = albums else {
                return
            }
            let artistIndex = self.artistsAndAlbums?.index(where: { (item) -> Bool in
                return item.artistId == artistId
            })
//            artistsAndAlbums?.insert(, at: <#T##Int#>)
        })
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return artistsAndAlbums?.count ?? 0
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> MediaItem {
        let item = artistsAndAlbums![indexPath.row]
        return item //NewsManager.sectionNewsItemFrom(new: new)
    }
}
