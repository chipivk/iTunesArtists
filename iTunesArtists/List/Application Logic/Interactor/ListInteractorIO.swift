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
}

protocol ListInteractorOutput: class {
    
}
