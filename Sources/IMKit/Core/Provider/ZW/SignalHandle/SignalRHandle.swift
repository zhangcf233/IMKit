//
//  File.swift
//  IMKit
//
//  Created by 张朝富 on 2025/7/23.
//

import SignalRClient

/// Signal 消息处理器
class SignalRHandle {
    
    /// 处理传入的消息
    ///
    /// - Parameter data: 从服务器接收到的数据
    func handleMessage(data: ArgumentExtractor) {
        if let baseMessage = getBaseMessage(from: data) {
            handleBaseMessage(baseMessage)
        } else if let sendMessageAsyncData = checkSendMessageAsync(argumentExtractor: data) {
            handleSendMessageAsync(sendMessageAsyncData)
        } else {
            debugPrint("*** 未知类型")
        }
    }
    
    /// 从参数中提取基础消息
    ///
    /// - Parameter argumentExtractor: 从服务器接收到的参数提取器
    /// - Returns: 如果成功提取则返回基础消息，否则返回nil
    private func getBaseMessage(from argumentExtractor: ArgumentExtractor) -> ChatMessageArguments<ChatMessageArgumentsData>? {
        let argument = try? argumentExtractor.getArgument(type: ChatMessageArguments<ChatMessageArgumentsData>.self)
        guard let _ = argument?.data,
              let _ = argument?.msg,
              let _ = argument?.type
        else {
            return nil
        }
        return argument
    }
    
}
