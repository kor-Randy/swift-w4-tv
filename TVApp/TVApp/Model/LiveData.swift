//
//  LiveData.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/26.
//

import Foundation

// MARK: - LiveData

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
