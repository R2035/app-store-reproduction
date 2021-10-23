//
//  TodayViewModel.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Combine
import Foundation

struct TodayViewModel {
    let sections: AnyPublisher<[(TodaySection, [TodayItem])], Never>

    private let _sections = CurrentValueSubject<[(TodaySection, [TodayItem])], Never>([
        (
            .feature(date: "10月23日 土曜日"),
            [
                .feature(description: "コレクション1", title: "Apple Arcade のトップゲーム", imageURL: ""),
                .feature(description: "コレクション2", title: "Apple Arcade のトップゲーム", imageURL: ""),
                .feature(description: "コレクション3", title: "Apple Arcade のトップゲーム", imageURL: ""),
                .feature(description: "コレクション4", title: "Apple Arcade のトップゲーム", imageURL: ""),
                .feature(description: "コレクション5", title: "Apple Arcade のトップゲーム", imageURL: "")
            ]
        )
    ])

    init() {
        sections = _sections
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
