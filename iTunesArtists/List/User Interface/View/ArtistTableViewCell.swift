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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        for subview in albumsContentView.subviews {
            subview.removeFromSuperview()
        }
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
    
    func addAlbums(_ albums: [AlbumDisplayData]) {
        for (index, album) in albums.enumerated() {
            let albumView = AlbumView(frame: .zero)
            let firstAlbum = index == 0
            albumView.set(album: album, showDiscographyLabel: firstAlbum)
            addAlbumViewInContainer(albumView)
        }
    }
    
    func addAlbumViewInContainer(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let upperView: UIView
        let upperViewIdentifier: String
        if let lastView = albumsContentView.subviews.last {
            upperView = lastView
            upperViewIdentifier = "[upperView]"
        } else {
            upperView = contentView
            upperViewIdentifier = "|"
        }
        
        albumsContentView.addSubview(view)
        
        let constraintViews = ["view" : view, "upperView" : upperView]
        let horizontalMargin: CGFloat = 0
        let metrics = ["horizontalMargin" : horizontalMargin, "verticalMargin" : 0]
        albumsContentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:\(upperViewIdentifier)-(verticalMargin@999)-[view]-(>=verticalMargin@998)-|", options: .alignAllCenterX, metrics: metrics, views: constraintViews))
        
        albumsContentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0@999)-[view]-(0@999)-|", options: .alignAllCenterY, metrics: metrics, views: constraintViews))
        
        albumsContentView.setNeedsUpdateConstraints()
    }
}
