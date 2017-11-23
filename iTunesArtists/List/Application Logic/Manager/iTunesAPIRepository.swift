//
//  iTunesAPIRepository.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation
import Alamofire
import UnboxedAlamofire

struct iTunesAPIRepository {
    
    let artistUrl = "https://itunes.apple.com/search?media=music&entity=musicArtist&attribute=artistTerm&term=%@"
    let albumsUrl = "https://itunes.apple.com/lookup?id=%ld&entity=album&limit=%ld"
    
    init() {
    }
}

// MARK: - iTunesAPIRepositoryInterface

extension iTunesAPIRepository : iTunesAPIRepositoryInterface {
    
    func requestArtistList(byName name: String, completionHandler: @escaping ([Artist]?, Error?) -> Void) {
        let url = String(format: artistUrl, name)
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<ITunesArtistsAPIResult>) in
            // handle response
            let result = response.result.value
            
            // handle error
            if let error = response.result.error as? UnboxedAlamofireError {
                print("error: \(error.description)")
                completionHandler(nil, response.result.error)
                return
            }
            completionHandler(result?.results, nil)
        }
    }
    
    func requestAlbumList(byArtistId artistId: Double, numberOfAlbums: Int = 2, completionHandler: @escaping AlbumsCompletionBlock) {
        let url = String(format: albumsUrl, artistId, numberOfAlbums)
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<ITunesAlbumsAPIResult>) in
            // handle response
            let result = response.result.value
            
            // handle error
            if let error = response.result.error as? UnboxedAlamofireError {
                print("error: \(error.description)")
                completionHandler(nil, response.result.error)
                return
            }
            completionHandler(result?.results, nil)
        }
    }
}
