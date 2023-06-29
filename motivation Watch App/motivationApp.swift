//
//  motivationApp.swift
//  motivation Watch App
//
//  Created by 杨恒一 on 2023/6/28.
//

import SwiftUI

@main
struct motivation_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                    ContentView()
                        .edgesIgnoringSafeArea([.horizontal,.bottom])
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("💛 予言")
                        .tag(1)

                    HealthView()
                        .edgesIgnoringSafeArea([.horizontal,.bottom])
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("💚 时辰")
                        .tag(2)
                }
            }
        }
    }
}
