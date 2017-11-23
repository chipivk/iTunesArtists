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
    
    init() {
        
    }
}

// MARK: - ListInteractorInput

extension ListInteractor : ListInteractorInput {
    
}
