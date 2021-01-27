//
//  DataType.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/26.
//

import Foundation

protocol DataType: Decodable {}

// MARK: - Original

struct Original: DataType {
    var clip: Clip
    var channel: Channel
}

// MARK: - Clip

struct Clip: Codable {
    var thumbnailUrl: String
    var duration: Int
    var title: String
}

struct LiveData: DataType {
    var live: Live
    var channel: Channel
}

// MARK: - Live

struct Live: Codable {
    var thumbnailUrl: String
    var playCount: Int
    var title: String
}

struct Channel: Codable {
    var name: String
    var visitCount: Int
    var createTime: String
}
