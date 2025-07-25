//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/25.
//

import Foundation
/// 组装 formdata
struct MultipartFormData {
    var boundary:String = UUID().uuidString
    
    func makeBody(parameters: [String: String], files: [String: (filename: String, data: Data, mimeType: String)]) -> (body: Data, contentType: String) {
            var body = Data()

            for (key, value) in parameters {
                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.append("\(value)\r\n")
            }

            for (fieldName, file) in files {
                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(file.filename)\"\r\n")
                body.append("Content-Type: \(file.mimeType)\r\n\r\n")
                body.append(file.data)
                body.append("\r\n")
            }

            body.append("--\(boundary)--\r\n")

            let contentType = "multipart/form-data; boundary=\(boundary)"
            return (body, contentType)
        }
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
