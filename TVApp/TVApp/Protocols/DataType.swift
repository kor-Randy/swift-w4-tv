//
//  DataType.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/26.
//

import Foundation

protocol DataType: Decodable {}

struct Item: Hashable {
    let id: UUID
    let data: DataType

    init(_ data: DataType) {
        self.data = data
        self.id = UUID()
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
