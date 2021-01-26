//
//  HomeViewModel.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/26.
//

import Foundation

class HomeViewModel {
    // MARK: Lifecycle

    init() {
        let originalDecoder = Decoder<Original>()
        originals = originalDecoder.decode(filename: "original")

        let liveDecoder = Decoder<LiveData>()
        lives = liveDecoder.decode(filename: "live")
    }

    // MARK: Internal

    var originals: [Original] = []
    var lives: [LiveData] = []
}
