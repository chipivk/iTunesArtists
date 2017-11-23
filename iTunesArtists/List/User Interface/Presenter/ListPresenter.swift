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
    
    var artist: [Artist]?
    
    init() {
        
    }
}

// MARK: - ListModuleInterface

extension ListPresenter : ListModuleInterface {
    func userDidEnter(text: String?) {
        guard let text = text else {
            return
        }
        interactor?.searchArtist(withText: text)
    }
}

// MARK: - ListInteractorOutput

extension ListPresenter : ListInteractorOutput {
    
}
