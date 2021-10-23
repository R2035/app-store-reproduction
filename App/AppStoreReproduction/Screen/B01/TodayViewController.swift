//
//  TodayViewController.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import UIKit

/// B01 Today
final class TodayViewController: UITableViewController {
    private let viewModel: TodayViewModel = AppDelegate.assembler.resolver.resolve()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.B01.title
    }
}
