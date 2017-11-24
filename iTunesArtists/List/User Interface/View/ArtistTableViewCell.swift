//
//  ArtistTableViewCell.swift
//  iTunesArtists
//
//  Created by Carlos López on 24/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var artistNameLabel: UILabel!
    @IBOutlet weak private var musicGenreLabel: UILabel!
    @IBOutlet weak private var albumsContentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ArtistTableViewCell {
    
    static var cellIdentifier: String {
        return "ArtistTableViewCell"
    }
    
    class func nibName() -> String {
        return "ArtistTableViewCell"
    }
    
    class func nib() -> UINib {
        return UINib(nibName: nibName(), bundle: nil)
    }
}

// MARK: - ListItemViewProtocol

extension ArtistTableViewCell : ListItemViewProtocol {
    
    func set(name: String?, musicGenre: String?) {
        artistNameLabel.text = name
        musicGenreLabel.text = musicGenre
    }
    
    func addAlbums(_albums: [AlbumDisplayData]) {
        
    }
}
