//
//  AppAssembly.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation
import Swinject

final class AppAssembly: Assembly {
    // MARK: Assembly

    public func assemble(container: Container) {
        container.register(TodayViewModel.self) { _ in
            TodayViewModel()
        }

        container.register(SearchViewModel.self) { _ in
            SearchViewModel()
        }
    }
}
