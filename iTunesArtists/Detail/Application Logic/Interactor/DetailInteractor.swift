//
//  DetailInteractor.swift
//  iTunesArtists
//
//  Created by Carlos López on 27/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

class DetailInteractor {
    
    var repository: iTunesAPIRepositoryInterface?
    var output: ListInteractorOutput?
    
    init() { }
}

// MARK: - DetailInteractorInput

extension DetailInteractor : DetailInteractorInput {
    
}
