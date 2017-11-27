//
//  DetailModuleInterface.swift
//  iTunesArtists
//
//  Created by Carlos López on 27/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

protocol DetailModuleInterface {
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfItems(inSection section: Int) -> Int
    func didSelectRow(atIndexPath indexPath: IndexPath)
    func setContent(toView view: AlbumItemViewProtocol, indexPath: IndexPath)
}
