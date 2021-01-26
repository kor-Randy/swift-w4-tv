//
//  Original.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/26.
//

import Foundation

// MARK: - Original

struct Original: DataType{
    var clip: Clip
    var channel: Channel
}

// MARK: - Clip

struct Clip: Codable {
    var thumbnailUrl: String
    var duration: Int
    var title: String
}
