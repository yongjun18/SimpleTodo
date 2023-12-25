//
//  CatContainerView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/12/23.
//

import SwiftUI

struct CatContainerView: View {
    @ObservedObject var calendarViewModel: CalendarViewModel
    @StateObject var catContainerViewModel = CatContainerViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            CatScreenView(catContainerViewModel: catContainerViewModel)
            
            HStack(spacing: 0) {
                ForEach(0..<6) { i in
                    CatButtonView(index: i, calendarViewModel: calendarViewModel, catContainerViewModel: catContainerViewModel)
                    if i+1 < 6 { Spacer() }
                }
            }
            .padding(EdgeInsets(top: 10, leading: CalendarCustom.viewPadding, bottom: 0, trailing: CalendarCustom.viewPadding))
        }
    }
}

struct CatButtonView: View {
    let index: Int
    @ObservedObject var calendarViewModel: CalendarViewModel
    @ObservedObject var catContainerViewModel: CatContainerViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                calendarViewModel.increaseCounter(index: index, diff: 1)
                catContainerViewModel.addRandomFootprint(colorString: "EventColor\(index+1)")
            },label: {
                ZStack {
                    Color.white
                    Image(systemName: calendarViewModel.calendarModel.eventCountArr[index] > 0 ? "pawprint.fill" : "pawprint")
                        .font(.system(size: 15))
                        .foregroundColor(Color(uiColor: UIColor(named: "EventColor\(index+1)") ?? UIColor.white))
                }
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .shadow(color: Color(uiColor: .systemGray3), radius: 2)
            })
            
            // 발자국 아래 버튼 (onTap : 1감소 / onLongPress: 0로 만들기)
            VStack(spacing: 0) {
                Text("\(calendarViewModel.calendarModel.eventCountArr[index])")
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                Spacer().frame(height: 25)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                calendarViewModel.increaseCounter(index: index, diff: -1)
            }
            .onLongPressGesture {
                calendarViewModel.makeCounterZero(index: index)
            }
        }
    }
}

struct CatScreenView: View {
    @ObservedObject var catContainerViewModel: CatContainerViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(catContainerViewModel.catFootprintArr) { footprint in
                    Image(systemName: "pawprint.fill")
                        .font(.system(size: CatFootprint.size))
                        .foregroundColor(Color(uiColor: UIColor(named: footprint.colorString) ?? UIColor.white))
                        .rotationEffect(.radians(footprint.angle))
                        .offset(
                            x: (proxy.size.width - CatFootprint.size) * footprint.x,
                            y: (proxy.size.height - CatFootprint.size) * footprint.y
                        )
                }
            }
        }
        .contentShape(Rectangle())
        .onLongPressGesture {
            catContainerViewModel.removeAllFootprint()
        }
    }
}


struct CatContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatContainerView(calendarViewModel: CalendarViewModel())
    }
}
