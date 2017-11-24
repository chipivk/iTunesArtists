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
        artists = nil
        artistsAndAlbums = nil
        output?.reloadData()
        repository?.requestArtistList(byName: text, completionHandler: { (artistList, error) in
            guard let artistList = artistList else {
                print("Error: \(error)")
                return
            }
            print("Artists: \(artistList)")
            self.artists = artistList
            self.artistsAndAlbums = artistList
            
//            output
            
            for artist in artistList {
                self.searchAlbums(byArtistId: artist.artistId)
            }
//            output.
        })
    }
    
    func searchAlbums(byArtistId artistId: Double, numberOfAlbums: Int = 2) {
        repository?.requestAlbumList(byArtistId: artistId, numberOfAlbums: numberOfAlbums, completionHandler: { (albums, error) in
            let artist = self.artists?.first(where: { (a) -> Bool in
                return a.artistId == artistId
            })
//            let artistIndex = self.artistsAndAlbums?.index(where: { (item) -> Bool in
//                return item.artistId == artistId
//            })
            guard let albums = albums, var artistFounded = artist, albums.count > 0 else {
                return
            }
            
            artistFounded.albums.append(contentsOf: albums)
            
//            for (i, album) in albums.enumerated() {
//
//                self.artistsAndAlbums?.insert(album, at: index + i)
//            }
            self.output?.reloadData()
        })
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return artists?.count ?? 0 //artistsAndAlbums?.count ?? 0
    }
    
    func item(atIndexPath indexPath: IndexPath) -> Artist {
        return artists![indexPath.row]
    }
}
