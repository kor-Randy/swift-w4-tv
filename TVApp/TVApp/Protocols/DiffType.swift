//
//  DiffType.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/27.
//

import Foundation

enum Section: Hashable {
    case main
}

struct Item: Hashable {
    // MARK: Lifecycle

    init(_ data: DataType) {
        self.data = data
        self.id = UUID()
    }

    // MARK: Internal

    let id: UUID
    let data: DataType

    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
