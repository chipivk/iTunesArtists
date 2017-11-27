//
//  RootRouting.swift
//  RTVE News
//
//  Created by Carlos López on 25/8/15.
//  Copyright (c) 2015 RTVE. All rights reserved.
//

import UIKit

class RootRouting {
    
    let window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showRootViewController(viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        window!.rootViewController = navigationController
    }
    
    func presentListInterface() {
        let vc = listViewControllerFromStoryboard()
        let presenter = ListPresenter()
        let interactor = ListInteractor()
        let repository = iTunesAPIRepository()
        
        vc.eventHandler = presenter
        
        interactor.repository = repository
        interactor.output = presenter
        
        presenter.interactor = interactor
        presenter.userInterface = vc
        presenter.rootRouting = self
        
        showRootViewController(viewController: vc)
    }
    
    func presentDetailInterface(withArtist artist: Artist, albums: [AlbumDisplayData]) {
        
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            return
        }
        
        let vc = detailViewControllerFromStoryboard()
        let presenter = DetailPresenter(artist: artist, albums: albums)
        
        vc.eventHandler = presenter
        
        presenter.userInterface = vc
        presenter.rootRouting = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func listViewControllerFromStoryboard() -> ListViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardIdentifier.List) as! ListViewController
        return viewController
    }
    
    private func detailViewControllerFromStoryboard() -> DetailViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardIdentifier.Detail) as! DetailViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
}
