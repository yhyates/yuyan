//
//  ContentView.swift
//  motivation Watch App
//
//  Created by 杨恒一 on 2023/6/28.
//

import SwiftUI
import WidgetKit

// 随机显示
struct ContentView: View {
    @State private var hitokotos: [HitokotoModel] = []
    @State private var currentHitokoto = ""
    @State private var hour: Int = UserDefaults.standard.integer(forKey: "WidgetCenter")
    var body: some View {
        Button( action: {
            WKInterfaceDevice.current().play(.click)
            withAnimation(.easeInOut(duration: 0.5)) {
                updateHitokoto()
            }        }, label: {
                VStack {
                    Spacer()
                    Text(currentHitokoto)
                        .foregroundColor(Color.primary)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                }
            })
        .padding(.bottom)
        .buttonStyle(.borderless)
        .onAppear {
            loadHitokotos()
            updateHitokoto()
        }
        .onAppear {
            let currentHour = Calendar.current.component(.hour, from: Date())
            if hour != currentHour {
                print("更新表盘")
                WidgetCenter.shared.reloadAllTimelines()
                hour = currentHour
                UserDefaults.standard.set(hour, forKey: "WidgetCenter")
            }
        }

    }
    func updateHitokoto() {
        if let randomHitokoto = hitokotos.randomElement() {
            currentHitokoto = randomHitokoto.hitokoto
        } else {
            currentHitokoto = "Not available"
        }
    }
    func loadHitokotos() {
        guard let url = Bundle.main.url(forResource: String(Int.random(in: 1...9)), withExtension: "json") else {
            print("Failed to find JSON file")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            hitokotos = try decoder.decode([HitokotoModel].self, from: data)
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
}



class HitokotoManager: ObservableObject {
    @Published var hitokotos: [HitokotoModel] = []
    @Published var currentHitokoto = ""
    @Published var currentIndex = 0
    
    private let userDefaultsKey = "currentHitokotoIndex"
    
    init() {
        loadHitokotos()
        updateHitokoto()
    }
    
    func updateHitokoto() {
        if hitokotos.isEmpty {
            currentHitokoto = "Not available"
            return
        }
        
        currentIndex = UserDefaults.standard.integer(forKey: userDefaultsKey)
        if currentIndex >= hitokotos.count {
            currentIndex = 0
        }
        
        currentHitokoto = hitokotos[currentIndex].hitokoto
        
        currentIndex += 1
        UserDefaults.standard.set(currentIndex, forKey: userDefaultsKey)
    }
    
    func loadHitokotos() {
        guard let url = Bundle.main.url(forResource: "e", withExtension: "json") else {
            print("Failed to find JSON file")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            hitokotos = try decoder.decode([HitokotoModel].self, from: data)
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
}
public struct HitokotoModel: Identifiable, Codable {
    public let id: Int
    public let hitokoto: String
}



// 顺序显示
struct ContentView2: View {
    @ObservedObject private var hitokotoManager = HitokotoManager()
    @State private var hour: Int = UserDefaults.standard.integer(forKey: "WidgetCenter")
    
    var body: some View {
        
        Button( action: {
            WKInterfaceDevice.current().play(.click)
            withAnimation(.easeInOut(duration: 0.5)) {
                hitokotoManager.updateHitokoto()
            }        }, label: {
                VStack {
                    Spacer()
                    Text(hitokotoManager.currentHitokoto)
                        .foregroundColor(Color.primary)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                }
            })
        .padding(.bottom)
        .buttonStyle(.borderless)
        .onAppear {
            hitokotoManager.loadHitokotos()
            hitokotoManager.updateHitokoto()
        }
        .onAppear {
            let currentHour = Calendar.current.component(.hour, from: Date())
            if hour != currentHour {
                print("更新表盘")
                WidgetCenter.shared.reloadAllTimelines()
                hour = currentHour
                UserDefaults.standard.set(hour, forKey: "WidgetCenter")
            }
        }
        
        
        
        
    }
}
