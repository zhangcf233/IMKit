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
    private func getBaseMessage(from argumentExtractor: ArgumentExtractor) -> Arguments<ArgumentsData>? {
        let argument = try? argumentExtractor.getArgument(type: Arguments<ArgumentsData>.self)
        guard let _ = argument?.data,
              let _ = argument?.msg,
              let _ = argument?.type
        else {
            return nil
        }
        return argument
    }
    
    
    /// 处理基础消息
    ///
    /// - Parameter data: 基础消息数据
    private func handleBaseMessage(_ data: Arguments<ArgumentsData>) {
        guard let res = data.data else {
            debugPrint("*** 基础响应数据异常")
            return
        }

        switch data.type {
            /// 退出群聊
            case "RemoveGroupAsync":
            debugPrint("退出群聊")
                
        default:
            debugPrint("*** 未知的响应消息类型 type:\(data.type)")
        }
    }
    
    /// 检查是否为聊天消息
    ///
    /// - Parameter argumentExtractor: 从服务器接收到的参数提取器
    /// - Returns: 如果是聊天消息则返回相应数据，否则返回nil
    private func checkSendMessageAsync(argumentExtractor: ArgumentExtractor) -> SendMessageAsyncData? {
        let sendMessageAsyncArgument = try? argumentExtractor.getArgument(type: Arguments<SendMessageAsyncData>.self)

        guard let code = sendMessageAsyncArgument?.code else {
            return nil
        }

        switch code {
        case 0:
            guard let data = sendMessageAsyncArgument?.data,
                  let type = sendMessageAsyncArgument?.type,
                  type == "SendMessageAsync"
            else {
                return nil
            }
            return data
        case 1:
            debugPrint("*** 不是好友")
            return nil
        default:
            debugPrint("未知的code")
            return nil
        }
    }
    
    /// 处理聊天消息
    ///
    /// - Parameter data: 聊天消息数据
    private func handleSendMessageAsync(_ data: SendMessageAsyncData) {
        debugPrint("*** 收到新消息 - Start - ")

        guard var id = data.id,
              let cid = data.cid,
              let timestamp = data.timestamp,
              let content = data.content,
              let fromid = data.fromid,
              let type = data.type,
              let mine = data.mine
        else {
            debugPrint("*** 聊天消息参数解析异常")
            return
        }

        switch type {
        case "friend",
             "group":

            let chatSendContent = content.kj.model(ChatSendContent.self)

            guard let msgType = chatSendContent?.msgType else {
                debugPrint("*** 消息体解析异常")
                return
            }

            /// 处理消息 id
            if type == "friend" {
                /// 非自己发的 消息id 为发送者id
                if !mine {
                    id = fromid
                }
            }

            switch msgType {
            /// 图片类型
            case "image":

                guard let url = chatSendContent?.url,
                      let width = chatSendContent?.width,
                      let height = chatSendContent?.height else {
                    debugPrint("图片类型消息 参数解析异常")
                    return
                }
                
            /// 文字类型
            case "text":
                guard let content = chatSendContent?.content else {
                    debugPrint("文字类型参数异常")
                    return
                }

                
            /// 组图类型
            case "multiple-pictures":

                guard let multipleContent = content.kj.model(ChatSendMultipleImageContent.self) else {
                    debugPrint("组图类型参数异常")
                    return
                }

                

            default:
                debugPrint("未知的消息类型")
            }

        default:
            debugPrint("*** 未知的消息类型")
        }
        debugPrint("*** 收到新消息 - End - ")
    }
}
