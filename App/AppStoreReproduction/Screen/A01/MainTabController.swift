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
        return todayViewController
    }()

    private lazy var gameViewController: GameViewController = {
        let gameViewController = GameViewController()
        return gameViewController
    }()

    private lazy var appViewController: AppViewController = {
        let appViewController = AppViewController()
        return appViewController
    }()

    private lazy var arcadeViewController: ArcadeViewController = {
        let arcadeViewController = ArcadeViewController()
        return arcadeViewController
    }()

    private lazy var searchViewController: SearchViewController = {
        let searchViewController = SearchViewController()
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
