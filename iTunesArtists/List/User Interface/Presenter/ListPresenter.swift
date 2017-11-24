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
        let item = interactor?.item(atIndexPath: indexPath)
        
        view.set(name: item?.artistName, musicGenre: item?.primaryGenreName)
        
    }
}

// MARK: - ListInteractorOutput

extension ListPresenter : ListInteractorOutput {
    
    func reloadData() {
        userInterface?.reloadTable()
    }
}
