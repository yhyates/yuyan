//
//  clock.swift
//  clock
//
//  Created by 杨恒一 on 2023/6/28.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), text: "心之所愿，无所不成。", text2: "")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), text: "心之所愿，无所不成。", text2: "")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            _ = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let text = getTextFromJSON()
            let entry = SimpleEntry(date: currentDate, text: text, text2: "")
            entries.append(entry)
        }
    
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
        
    }
    struct HitokotoModel: Identifiable, Codable {
        public let id: Int
        public let hitokoto: String
    }
    
    func getTextFromJSON() -> String {
        do {
            // 读取l.json文件的路径
            guard let fileURL = Bundle.main.url(forResource: String(Int.random(in: 1...9)), withExtension: "json") else {
                return ""
            }
            // 读取文件内容
            let data = try Data(contentsOf: fileURL)
            // 解码JSON数据
            let decoder = JSONDecoder()
            let entries = try decoder.decode([HitokotoModel].self, from: data)
            // 获取第一个entry的文本数据
            if let randomEntry = entries.randomElement() {
                return randomEntry.hitokoto
            }
        } catch {
            print("Error reading JSON file: \(error)")
        }
        return ""
      }
}

struct Provider2: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), text: "戌时 - 心包经运行", text2: "保持好心情、娱乐现在时")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), text: "戌时 - 心包经运行", text2: "保持好心情、娱乐现在时")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        
        for hourOffset in 0 ..< 12 {
            let entryDate = calendar.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entryHour = (hour + hourOffset) % 24
            var entryText = ""
            var entryText2 = ""
            switch entryHour {
              case 1, 2:
                  entryText = "丑时 - 肝经运行"
                  entryText2 = "排毒进行时、及时入睡"
              case 3, 4:
                  entryText = "寅时 - 肺经运行"
                  entryText2 = "血液循环中、全身代谢"
              case 5, 6:
                  entryText = "卯时 - 大肠经运行"
                  entryText2 = "身体排毒中、吸收营养"
              case 7, 8:
                  entryText = "辰时 - 胃经运行"
                  entryText2 = "早饭不可缺、营养身体"
              case 9, 10:
                  entryText = "巳时 - 脾经运行"
                  entryText2 = "吸收营养、造血运化中"
              case 11, 12:
                  entryText = "午时 - 心经运行"
                  entryText2 = "午饭应美食、小休安神"
              case 13, 14:
                  entryText = "未时 - 小肠经运行"
                  entryText2 = "饮水降火、清浊此刻分"
              case 15, 16:
                  entryText = "申时 - 膀胱经运行"
                  entryText2 = "活动排毒、养阴身体舒"
              case 17, 18:
                  entryText = "酉时 - 肾经运行"
                  entryText2 = "存储精华、不宜运动"
              case 19, 20:
                  entryText = "戌时 - 心包经运行"
                  entryText2 = "保持好心情、释放压力"
              case 21, 22:
                  entryText = "亥时 - 三焦经运行"
                  entryText2 = "百脉疏通，放松睡觉时"
              case 23, 0:
                  entryText = "子时 - 胆经运行"
                  entryText2 = "胆开始代谢、及时入睡"
              default:
                  break
              }
              
              let entry = SimpleEntry(date: entryDate, text: entryText, text2: entryText2)
              entries.append(entry)
        }
    
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
        
    }

    
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let text: String
    let text2: String
}

struct clockEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        Text(entry.text)
            .font(.callout)
            .frame(maxWidth: .infinity)

    }
}
struct clockEntryView2 : View {
    var entry: Provider2.Entry
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                Text(entry.text)
                    //.font(.system(size: 21, weight: .bold, design: .default))
                    .foregroundColor(Color("clock"))
                    .padding(.leading)
                    .fixedSize(horizontal: true, vertical: false)

                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            Divider()
                .padding(.horizontal)

            HStack{
                Text(entry.text2)
                    .font(.footnote)
                    .padding(.leading)

                Spacer()
            }
            .frame(maxWidth: .infinity)

        }
        .frame(maxWidth: .infinity)

    }
}

@main
struct ClockWidgets: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        Clock()
        Clock2()
    }
}

struct Clock: Widget {
    private let kind: String = "随机显示金句"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            clockEntryView(entry: entry)
                .unredacted()
        }
        .configurationDisplayName("随机显示金句")
        .description("This is an example widget.")
    }
}

struct Clock2: Widget {
    private let kind: String = "十二时辰经络养生"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider2()) { entry in
            clockEntryView2(entry: entry)
                .unredacted()
        }
        .configurationDisplayName("十二时辰经络养生")
        .description("This is an example widget.")
    }
}
