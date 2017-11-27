//
//  DetailViewController.swift
//  iTunesArtists
//
//  Created by Carlos López on 27/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    var eventHandler: DetailModuleInterface?

    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler?.viewDidLoad()
        configureNavigationBarStyle()
        initializeTableView()
    }
    
    func initializeTableView() {
        tableView.register(AlbumTableViewCell.nib(), forCellReuseIdentifier: AlbumTableViewCell.cellIdentifier)
    }
    
    func configureNavigationBarStyle() {
        edgesForExtendedLayout = .all
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 48/255.0, green: 153/255.0, blue: 251/255.0, alpha: 1)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - DetailViewInterface

extension DetailViewController : DetailViewInterface {
    
    func set(title: String) {
        self.title = title
    }
}

// MARK: - UITableViewDataSource

extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let eventHandler = eventHandler else {
            return 0
        }
        return eventHandler.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let eventHandler = eventHandler else {
            return 0
        }
        return eventHandler.numberOfItems(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.cellIdentifier) as! AlbumTableViewCell
        eventHandler?.setContent(toView: cell as AlbumItemViewProtocol, indexPath: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension DetailViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.didSelectRow(atIndexPath: indexPath)
    }
}
