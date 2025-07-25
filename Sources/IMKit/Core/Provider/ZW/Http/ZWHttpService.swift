//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/25.
//

import Foundation
import KakaJSON

/// 正万请求服务
public class ZWHttpService:BaseViewModel{
    
    init(_ config:IMConfig){
        self.config = config
    }
    
    var config:IMConfig
    
    func send<T: Convertible>(
        _ to: ZWApi,
        done: @escaping (Result<T, RequestError>) -> Void
    ) async {
        do {
            
            guard let url = URL(string: config.url + to.path) else {
                done(.failure(.invalidURL))
                return
            }
            
            if config.token.isEmpty {
                done(.failure(.tokenNull))
                return
            }

            let data = try await postMultipartFormData(
                to: url,
                headers: ["AppToken": config.token]
            )

            guard let json = String(data: data, encoding: .utf8) else {
                done(.failure(.jsonFailed))
                return
            }
            
            debugPrint("*** 接口返回json",json)

            let auth = json.kj.model(ZWAuthFailed.self)
            
            if auth?.Status == false && auth?.Data == 401 && auth?.Message == "no session"{
                done(.failure(.authFailed))
                return
            }
            
            guard let model = json.kj.model(type: T.self) as? T else {
                done(.failure(.modelFailed))
                return
            }

            done(.success(model))

        } catch {
            done(.failure(.unowned(error)))
        }
    }
}
