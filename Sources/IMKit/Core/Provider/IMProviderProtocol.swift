//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/22.
//

import Foundation

protocol IMProvider:BaseViewModel {
    
    var name:String {get}
    
    var status:IMClientStatus {get}
    
    func connect()
    
    func disconnect()
    
}
