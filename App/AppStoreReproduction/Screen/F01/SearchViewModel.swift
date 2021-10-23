//
//  SearchViewModel.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Combine
import Foundation

struct SearchViewModel {
    let sections: AnyPublisher<[(SearchSection, [SearchItem])], Never>

    private let _sections = CurrentValueSubject<[(SearchSection, [SearchItem])], Never>([
        (
            .find(title: "見つける"),
            [
                .find(title: "ナンプレ"),
                .find(title: "赤ちゃん"),
                .find(title: "髪型"),
                .find(title: "高画質")
            ]
        )
    ])

    init() {
        sections = _sections
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
