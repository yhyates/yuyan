//
//  InfoView.swift
//  motivation
//
//  Created by 杨恒一 on 2023/6/29.
//

import Foundation
import SwiftUI
import SafariServices


struct InfoView: View {
    func joinQQGroup(groupUin: String, key: String) {
        let urlStr = "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=\(groupUin)&key=\(key)&card_type=group&source=external&jump_from=webapi"
        guard let url = URL(string: urlStr) else {
            return
        }
        UIApplication.shared.open(url)
    }
    @State private var opensource = false

    var body: some View {
        
        List {
            
            Section {
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "quote.opening")
                            .foregroundColor(.purple)
                            .opacity(0.7)
                        Text("予言，天予金言。提供思考金句")
                            .foregroundColor(.primary)
                    }
                }
        
                
            } header: {
                Text("软件介绍")
                    .font(.subheadline)
            }
            
            Section {
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "swatchpalette.fill")
                            .foregroundColor(.blue)
                            .opacity(0.7)
                        Text("金句和时辰经络支持「表盘组件」")
                            .foregroundColor(.primary)
                    }
                }
        
                
            } header: {
                Text("功能强调")
                    .font(.subheadline)
            }
            
            Section {
                Button(action: {
                }) {
                    HStack {
                        Image(systemName: "applewatch")
                            .foregroundColor(.orange)
                        Text("手表端安装问题")
                            .foregroundColor(.primary)
                    }
                }
                
                Button(action: {
                }) {
                    HStack {
                        Text("购买后，为什么手表上依旧显示价格？\n回答：这是正常显示，在手机或手表只要购买过一次即可，虽然显示价格，但是并不发生二次扣费。因此请按照商店提示，正常操作即可。")
                            .foregroundColor(.primary)
                            .opacity(0.6)
                    }
                }
                
                Button(action: {
                }) {
                    HStack {
                        Text("手表安装时为什么一直转圈？\n回答：请将手机连接至Wi-Fi状态，同时检查手表系统是否在9.0及以上。")
                            .foregroundColor(.primary)
                            .opacity(0.6)
                    }
                }
                
                
            } header: {
                Text("下载问题")
                    .font(.subheadline)
            }
            
            Section {
                Button(action: {
                    joinQQGroup(groupUin: "102779555", key: "679cbc46f47031c49fdf2d97847c59a71c1bea58d114af05922dd5431b8c6a0f")

                }) {
                    

                    HStack {
                        Image(systemName: "square.and.arrow.up.on.square")
                            .foregroundColor(.cyan)
                        Text("一键加入QQ群:  102779555")
                            .foregroundColor(.primary)
                    }
                    
                    
                }
            } header: {
                Text("反馈")
                    .font(.subheadline)
            } footer: {
                Text("若满员，请在群简介里找到最新的群号。")
            }
            
            
            Section {
                Button(action: {
                    opensource = true
                }) {
                    HStack {
                        Image(systemName: "app.badge.fill")
                            .foregroundColor(.gray)
                        Text("「予言」已遵循AGPL协议开源")
                            .foregroundColor(.primary)
                    }
                }
                
            } header: {
                Text("协议")
                    .font(.subheadline)
            }
            .sheet(isPresented: $opensource) {
                SafariView(url: URL(string: "https://github.com/yhyates/yuyan")!)
            }
            
        }
        
    }
}


struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

    }
}
