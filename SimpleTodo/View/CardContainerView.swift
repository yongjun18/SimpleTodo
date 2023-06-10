//
//  CardContainerView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/10.
//

import SwiftUI

struct CardCustom {
    static public let designedCardWidth = 272.0
    static public let designedScreenWidth = 360.0
}

struct Card: View {
    var color: Color
    var title: String
    var amount: Int
    var targetAmount: Int
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            color
            VStack(spacing: 5) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                Text("\(amount)/\(targetAmount)회")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(EdgeInsets(top: 20, leading: 24, bottom: 0, trailing: 0))
            Spacer()
        }
    }
}

struct CardContainerView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Card(color: Color("EventColor1"), title: "운동 A", amount: 4, targetAmount: 24)
                    .frame(width: proxy.size.width * CardCustom.designedCardWidth / CardCustom.designedScreenWidth)
                    .cornerRadius(9)
                
                Card(color: Color("EventColor2"), title: "운동 B", amount: 4, targetAmount: 24)
                    .frame(width: proxy.size.width * CardCustom.designedCardWidth / CardCustom.designedScreenWidth)
                    .cornerRadius(9)
                
                Card(color: Color("EventColor3"), title: "운동 C", amount: 4, targetAmount: 24)
                    .frame(width: proxy.size.width * CardCustom.designedCardWidth / CardCustom.designedScreenWidth)
                    .cornerRadius(9)
            }
            .frame(width: proxy.size.width)
        }
    }
}

struct CardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CardContainerView()
    }
}
