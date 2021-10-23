//
//  AppDelegate.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Swinject
import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    private static let container = Container()

    static let assembler: Assembler = {
        let assembler = Assembler(container: container)
        assembler.apply(assemblies: [
            AppAssembly()
        ])
        return assembler
    }()

    // MARK: UIApplicationDelegate

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {}
}
