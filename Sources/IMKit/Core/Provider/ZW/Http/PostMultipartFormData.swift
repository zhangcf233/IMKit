//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/25.
//

import Foundation

func postMultipartFormData(
    to url: URL,
    parameters: [String: String] = [:],
    files: [String: (filename: String, data: Data, mimeType: String)] = [:],
    headers: [String: String] = [:]
) async throws -> Data {
    let form = MultipartFormData()
    let (body, contentType) = form.makeBody(parameters: parameters, files: files)

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue(contentType, forHTTPHeaderField: "Content-Type")

    // 添加自定义请求头
    for (key, value) in headers {
        request.setValue(value, forHTTPHeaderField: key)
    }

    request.httpBody = body

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode else {
        throw URLError(.badServerResponse)
    }

    return data
}
