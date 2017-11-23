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

typealias CompletionBlock = (_ result: [Artist]?, _ error: Error?) -> Void

struct iTunesAPIRepository {
    
    let apiUrl = "https://itunes.apple.com/search?media=music&entity=allArtist&attribute=allArtistTerm&term=%@"
    
    init() {
        
    }
}

// MARK: - iTunesAPIRepositoryInterface

extension iTunesAPIRepository : iTunesAPIRepositoryInterface {
    
    func requestArtists(byName name: String, completionHandler: CompletionBlock) {
        let url = String(format: apiUrl, name)
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<ITunesAPIResult>) in
            // handle response
            let result = response.result.value
            
            // handle error
            if let error = response.result.error as? UnboxedAlamofireError {
                print("error: \(error.description)")
                completionHandler(nil, nil)
                return
            }
            completionHandler(result?.results as! [Artist], nil)
        }
    }
}
