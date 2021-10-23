//
//  SearchItem.swift
//  AppStoreReproduction
//
//  Created by oe on 2021/10/23.
//

import Foundation

enum SearchItem: Hashable {
    case find(title: String)

    case recommendation(imageURL: String, title: String, description: String, installStatus: String, warning: String)
}
