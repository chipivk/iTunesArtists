//
//  ListModuleInterface.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

protocol ListModuleInterface {
    func userDidEnter(text: String?)
    func numberOfSections() -> Int
    func numberOfItems(inSection section: Int) -> Int
    func didSelectRow(atIndexPath indexPath: IndexPath)
    func setContent(toView view: ListItemViewProtocol, indexPath: IndexPath)
}
