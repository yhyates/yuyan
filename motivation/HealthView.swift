//
//  HealthView.swift
//  motivation Watch App
//
//  Created by 杨恒一 on 2023/6/29.
//

import Foundation
import SwiftUI

struct HealthView: View {
    let currentTime = Calendar.current.component(.hour, from: Date())
    @State private var entryText = ""
    @State private var entryText2 = ""
    @State private var entryText3 = ""

    var body: some View {
        VStack {
            Spacer()

            Text(entryText3)
                .font(.largeTitle)
                .fontWeight(.medium)
            
            Text("「"+entryText+"」")
                .font(.title3)
                .padding(.all)
            
            Divider()
                .padding(.bottom)
            
            
            Text(entryText2)
                .padding(.horizontal)
                //.foregroundColor(Color.white)
                .opacity(0.7)
            
            Spacer()
            
        }
        .padding(.horizontal)
        .onTapGesture {
            getCharacterForHour(currentTime)
        }
        .onAppear {
            getCharacterForHour(currentTime)
        }
    }

    func getCharacterForHour(_ hour: Int) {
        switch hour {
        case 1, 2:
            entryText = "肝经运行"
            entryText3 = "丑时"
            entryText2 = "肝经旺盛，养血。肝是“肝藏血”的脏器，思维和行动需要气血的支持。在丑时，肝经最旺盛，完成废旧血液的淘汰和新鲜血液的产生。丑时的熟睡对肝脏的疏泄功能非常重要，有助于解毒过滤。如果长时间不入睡，会导致肝脏功能紊乱，出现面色青灰、情绪倦怠和易怒等肝病症状"
        case 3, 4:
            entryText = "肺经运行"
            entryText3 = "寅时"
            entryText2 = "肺经最旺盛，将肝脏解毒的新鲜血液输送到全身。清晨是肺经旺盛的时候，人们面色红润、精力充沛。在寅时，肺病症状可能会更加明显，如剧咳、哮喘或发烧"
        case 5, 6:
            entryText = "大肠经运行"
            entryText3 = "卯时"
            entryText2 = "大肠经旺盛，有利于排泄功能。在卯时，大肠经进入兴奋状态，吸收食物中的水分和营养，排出废物。在这个时候，多饮水可以促进大肠吸收水分，促进排泄。排泄结束后，可以进行提肛运动，有助于治疗便秘、痔疮和脱肛等病症"
        case 7, 8:
            entryText = "胃经运行"
            entryText3 = "辰时"
            entryText2 = "胃经旺盛，有利于消化功能。早晨是天地阳气最旺盛的时候，吃早饭是最容易消化的时候。在辰时，胃经达到高峰，吃好早饭可以补充营养。不必担心吃多了会发胖，因为胃经和脾经在运化，能够有效消化吸收。"
        case 9, 10:
            entryText = "脾经运行"
            entryText3 = "巳时"
            entryText2 = "脾经旺盛，有利于吸收营养和生血。脾经是气血生化的源头，与胃一起负责消化、吸收和排泄。在巳时，脾经达到高峰，可以运化水谷，提供气血营养。脾功能好的人，消化吸收良好，唇色红润。"
        case 11, 12:
            entryText = "心经运行"
            entryText3 = "午时"
            entryText2 = "心经旺盛，有利于周身血液循环。心推动血液运行，养神、养气、养筋。在午时稍作休息，有益于心脏的养育。下午和晚上精力充沛。心率过缓的人可以在11点补充心阳，心率过快的人可以滋养心阳"
        case 13, 14:
            entryText = "小肠经运行"
            entryText3 = "未时"
            entryText2 = "小肠经旺盛，有利于吸收营养。小肠经负责接受经胃初步消化的食物，并进一步分泌清浊，将水液归于膀胱，糟粕送入大肠，将水谷化为精微。在未时，小肠经对人体的营养进行消化吸收。"
        case 15, 16:
            entryText = "膀胱经运行"
            entryText3 = "申时"
            entryText2 = "膀胱经最旺盛。膀胱经从足后跟沿着后小腿、后脊柱正中间的两旁一直上到脑部，是一条重要的经脉。膀胱经问题可能导致小腿疼痛、后脑疼痛和记忆力衰退等症状。在申时特别犯困可能是阳虚的表现。"
        case 17, 18:
            entryText = "肾经运行"
            entryText3 = "酉时"
            entryText2 = "肾经最旺盛。肾藏生殖之精和五脏六腑之精，是先天之根。在酉时，肾经进入储藏精华的时刻。肾阳虚的人可以在酉时补充肾阳。"
        case 19, 20:
            entryText = "心包经运行"
            entryText3 = "戌时"
            entryText2 = "心包经最旺盛。心包是心脏的外膜，具有保护心脏和调节气血的作用。在戌时，心包经兴旺，可以清除心脏周围的外邪，保持心脏的健康状态。心脏发冷的人可以在戌时补充肾阳，心脏闷热的人可以滋养心阴"
        case 21, 22:
            entryText = "三焦经运行"
            entryText3 = "亥时"
            entryText2 = "三焦经最旺盛。三焦是六腑中最大的腑，主持诸气、疏通水道。在亥时，身体和灵魂都可以沉浸在温暖的黑暗中，让生命和身体在休息中得到轮回。"
        case 23, 0:
            entryText = "胆经运行"
            entryText3 = "子时"
            entryText2 = "胆经旺盛，胆汁需要新陈代谢。在子时前入睡，晨醒后头脑清新、气色红润。子时不入睡的人面色青白，易患肝"
        default:
            break
        }
    }
}
