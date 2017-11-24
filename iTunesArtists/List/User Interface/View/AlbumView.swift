//
//  AlbumView.swift
//  iTunesArtists
//
//  Created by Carlos López on 24/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import UIKit

@IBDesignable class AlbumView: UIView {
    
    @IBOutlet weak private var discographicLabel: UILabel!
    @IBOutlet weak private var albumNameLabel: UILabel!
    @IBOutlet weak private var yearLabel: UILabel!
    @IBOutlet weak private var thubmnailImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.backgroundColor = .clear
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AlbumView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
}

extension AlbumView {
    func set(album: AlbumDisplayData, showDiscographyLabel: Bool = false) {
        discographicLabel.isHidden = !showDiscographyLabel
        albumNameLabel.text = album.name
        yearLabel.text = album.year
        URLSession.shared.dataTask(with: album.thumbnailURL) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    self.thubmnailImageView.image = nil
                }
                return
            }
            DispatchQueue.main.async {
                self.thubmnailImageView.image = UIImage(data: data)
            }
        }.resume()
    }
}
