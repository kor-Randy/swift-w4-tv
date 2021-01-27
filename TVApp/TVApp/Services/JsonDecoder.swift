//
//  JsonDecoder.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/26.
//

import UIKit

class Decoder {
    static func decode<T: Decodable>(filename: String) -> [T] {
        let decoder = JSONDecoder()
        var datas: [T] = []
        guard let data = NSDataAsset(name: filename) else { return [] }
        do {
            datas = try decoder.decode([T].self, from: data.data)

        } catch {
            print(error.localizedDescription)
        }
        return datas
    }
}
