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
            .find,
            [
                .title(title: "見つける"),
                .find(title: "ナンプレ"),
                .find(title: "赤ちゃん"),
                .find(title: "髪型"),
                .find(title: "高画質")
            ]
        ),
        (
            .recommendation,
            [
                .title(title: "あなたにおすすめ"),
                .recommendation(imageURL: "", title: "タイトルタイトルタイトル1", description: "説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明", installStatus: "入手", warning: "アプリ内課金"),
                .recommendation(imageURL: "", title: "タイトルタイトルタイトル2", description: "説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明", installStatus: "入手", warning: ""),
                .recommendation(imageURL: "", title: "タイトル3", description: "説明説明説明説明説明説明説明", installStatus: "入手", warning: "アプリ内課金"),
                .recommendation(imageURL: "", title: "タイトルタイトルタイトル4", description: "説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明", installStatus: "入手", warning: ""),
                .recommendation(imageURL: "", title: "タイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトルタイトル5", description: "説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明説明", installStatus: "入手", warning: "アプリ内課金"),
                .recommendation(imageURL: "", title: "タイトル6", description: "説明説明説明説明説明説明説明説明説明説明", installStatus: "入手", warning: "アプリ内課金")
            ]
        )
    ])

    init() {
        sections = _sections
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
