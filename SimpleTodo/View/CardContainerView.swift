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

// 출처 : https://prafullkumar77.medium.com/swiftui-how-to-make-filling-wave-animation-cd135e33b3d8
struct Wave: Shape {
    var offset: Angle
    var percent: Double

    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }

    func path(in rect: CGRect) -> Path {
        var p = Path()
        let waveHeight: CGFloat = 5.0
        let yOffset = CGFloat(1 - percent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        p.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(Int(CGFloat(sin(offset.radians))))))

        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            let y = yOffset + CGFloat(waveHeight) * CGFloat(sin(Angle(degrees: angle).radians))
            p.addLine(to: CGPoint(x: x, y: y))
        }

        // 오른쪽 끝 떨림 현상을 숨기기 위한 연장
        p.addLine(to: CGPoint(x: rect.width + 20, y: yOffset + CGFloat(waveHeight) * CGFloat(sin(Angle(degrees: endAngle.degrees).radians))))
        p.addLine(to: CGPoint(x: rect.width + 20, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()

        return p
    }
}

struct Card: View {
    var color: Color
    var title: String
    var amount: Int
    var targetAmount: Int
    
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffset2 = Angle(degrees: 180)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white
            
            Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(amount)/Double(targetAmount))
                .fill(color)
                .opacity(0.5)
            Wave(offset: Angle(degrees: self.waveOffset2.degrees), percent: Double(amount)/Double(targetAmount))
                .fill(color)
                .opacity(0.5)
            
            VStack(spacing: 5) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                Text("\(amount)/\(targetAmount)회")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(EdgeInsets(top: 20, leading: 24, bottom: 0, trailing: 0))
        }
        .cornerRadius(9)
        .shadow(color: Color(red: 134.0/255, green: 141.0/255, blue: 168.0/255, opacity: 0.25), radius: 4, x: 0, y: -1)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                self.waveOffset2 = Angle(degrees: -180)
            }
        }
    }
}

struct CardContainerView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Card(color: Color("EventColor1"), title: "운동 A", amount: 18, targetAmount: 24)
                    .frame(width: proxy.size.width * CardCustom.designedCardWidth / CardCustom.designedScreenWidth)
                    .offset(x: -proxy.size.width * 66 / CardCustom.designedScreenWidth)
                    .scaleEffect(0.79)
                    .opacity(0.2)
                    
                
                Card(color: Color("EventColor2"), title: "운동 B", amount: 23, targetAmount: 24)
                    .frame(width: proxy.size.width * CardCustom.designedCardWidth / CardCustom.designedScreenWidth)
                    .offset(x: -proxy.size.width * 28 / CardCustom.designedScreenWidth)
                    .scaleEffect(0.91)
                    .opacity(0.5)
                    
                
                Card(color: Color("EventColor3"), title: "운동 C", amount: 21, targetAmount: 24)
                    .frame(width: proxy.size.width * CardCustom.designedCardWidth / CardCustom.designedScreenWidth)
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
