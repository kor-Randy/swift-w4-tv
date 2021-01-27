//
//  HomeViewModel.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/26.
//

import UIKit

class HomeViewModel {
    // MARK: Lifecycle

    init() {
        let originals: [Original] = Decoder.decode(filename: "original")
        items = originals.map({ (item) -> Item in
            Item(item)
        })
        
        let lives:[LiveData]  = Decoder.decode(filename: "live")
        items.append(contentsOf: lives.map({ (item) -> Item in
            Item(item)
        }))
        
    }

    // MARK: Internal

    var items: [Item] = []
}
