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
/// ViewModelも作成不要
final class MainTabController: UITabBarController {
    private lazy var todayViewController: TodayViewController = {
        let todayViewController = TodayViewController()
        return todayViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            todayViewController
        ]
    }
}
