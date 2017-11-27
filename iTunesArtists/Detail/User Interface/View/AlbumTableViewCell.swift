//
//  AlbumTableViewCell.swift
//  iTunesArtists
//
//  Created by Carlos López on 27/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var collectionNameLabel: UILabel!
    @IBOutlet weak private var yearLabel: UILabel!
    @IBOutlet weak private var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AlbumTableViewCell {
    
    static var cellIdentifier: String {
        return "AlbumTableViewCell"
    }
    
    class func nibName() -> String {
        return "AlbumTableViewCell"
    }
    
    class func nib() -> UINib {
        return UINib(nibName: nibName(), bundle: nil)
    }
}

// MARK: - AlbumItemViewProtocol

extension AlbumTableViewCell : AlbumItemViewProtocol {
    
    func set(collectionName: String, year: String, thumbnailImageURL: URL) {
        collectionNameLabel.text = collectionName
        yearLabel.text = year
        
        URLSession.shared.dataTask(with: thumbnailImageURL) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = nil
                }
                return
            }
            DispatchQueue.main.async {
                self.thumbnailImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
