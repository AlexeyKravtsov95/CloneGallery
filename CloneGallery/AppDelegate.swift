//
//  AppDelegate.swift
//  CloneGallery
//
//  Created by a.kravcov on 04.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
               window = UIWindow(frame: UIScreen.main.bounds)
        
        let mediaController = MediaLibraryController()
        mediaController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        
        let forYouController = ForYouController()
        forYouController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)

        let albumsViewController = GalleryCollectionViewController()
               
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        let navigationController = UINavigationController(rootViewController: albumsViewController)
        
        navigationController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        navigationController.navigationBar.prefersLargeTitles = true
        
        tabBarController.setViewControllers([mediaController,
                                             forYouController,
                                             navigationController,
                                             searchViewController],
                                            animated: true)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

