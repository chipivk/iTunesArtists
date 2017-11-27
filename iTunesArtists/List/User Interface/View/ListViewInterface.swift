//
//  ListViewInterface.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import Foundation

protocol ListViewInterface : class {
    func reloadTable()
    func refreshCell(atIndexPath indexPath: IndexPath)
}
