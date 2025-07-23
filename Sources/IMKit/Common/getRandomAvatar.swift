//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/19.
//

import Foundation

public func getRandomAvatar() -> URL {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let randomText = String((0..<4).map { _ in letters.randomElement()! })
    let urlString = "https://dummyimage.com/100x100/000/fff&text=\(randomText)"
    return URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
}
