//
//  ListViewController.swift
//  iTunesArtists
//
//  Created by Carlos López on 23/11/17.
//  Copyright © 2017 Carlos López. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var eventHandler: ListModuleInterface?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    func initializeView() {
        configureNavigationBarStyle()
        initializeTableView()
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.placeholder = "Type to search"
    }
    
    func initializeTableView() {
        tableView.register(ArtistTableViewCell.nib(), forCellReuseIdentifier: ArtistTableViewCell.cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureNavigationBarStyle() {
        edgesForExtendedLayout = .all
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 48/255.0, green: 153/255.0, blue: 251/255.0, alpha: 1)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - ListViewInterface

extension ListViewController : ListViewInterface {
    func reloadTable() {
        tableView.reloadData()
    }
}

// MARK: - UISearchBarDelegate

extension ListViewController : UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        eventHandler?.userDidEnter(text: searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - UITableViewDelegate

extension ListViewController : UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension ListViewController : UITableViewDataSource {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.cellIdentifier) as! ArtistTableViewCell
        eventHandler?.setContent(toView: cell as! ListItemViewProtocol, indexPath: indexPath)
        
        return cell
    }
}
