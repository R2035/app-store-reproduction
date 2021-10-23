//
//  MainTabController.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import UIKit

/// A01 メイン
/// UITabBarControllerでタブを切り替えるだけの画面
/// ViewModelは作成不要
final class MainTabController: UITabBarController {
    private lazy var todayViewController: TodayViewController = {
        let todayViewController = TodayViewController()
        let image = UIImage(systemName: "newspaper")
        todayViewController.tabBarItem = UITabBarItem(title: L10n.B01.title, image: image, selectedImage: image)
        return todayViewController
    }()

    private lazy var gameViewController: GameViewController = {
        let gameViewController = GameViewController()
        let image = UIImage(systemName: "gamecontroller")
        gameViewController.tabBarItem = UITabBarItem(title: L10n.C01.title, image: image, selectedImage: image)
        return gameViewController
    }()

    private lazy var appViewController: AppViewController = {
        let appViewController = AppViewController()
        let image = UIImage(systemName: "app")
        appViewController.tabBarItem = UITabBarItem(title: L10n.D01.title, image: image, selectedImage: image)
        return appViewController
    }()

    private lazy var arcadeViewController: ArcadeViewController = {
        let arcadeViewController = ArcadeViewController()
        let image = UIImage(systemName: "circle.grid.cross")
        arcadeViewController.tabBarItem = UITabBarItem(title: L10n.E01.title, image: image, selectedImage: image)
        return arcadeViewController
    }()

    private lazy var searchViewController: SearchViewController = {
        let searchViewController = SearchViewController()
        let image = UIImage(systemName: "magnifyingglass")
        searchViewController.tabBarItem = UITabBarItem(title: L10n.F01.title, image: image, selectedImage: image)
        return searchViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            todayViewController,
            UINavigationController(rootViewController: gameViewController),
            UINavigationController(rootViewController: appViewController),
            UINavigationController(rootViewController: arcadeViewController),
            UINavigationController(rootViewController: searchViewController)
        ]
    }
}
