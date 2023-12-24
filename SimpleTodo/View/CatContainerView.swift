//
//  CatContainerView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/12/23.
//

import SwiftUI

struct CatContainerView: View {
    @ObservedObject var calendarViewModel: CalendarViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Color.white //TODO: CatScreenView 구현 및 적용
            
            HStack(spacing: 0) {
                CatButtonView(colorName: "EventColor1", calendarViewModel: calendarViewModel)
                CatButtonView(colorName: "EventColor2", calendarViewModel: calendarViewModel)
                CatButtonView(colorName: "EventColor3", calendarViewModel: calendarViewModel)
                CatButtonView(colorName: "EventColor4", calendarViewModel: calendarViewModel)
                CatButtonView(colorName: "EventColor5", calendarViewModel: calendarViewModel)
                CatButtonView(colorName: "EventColor6", calendarViewModel: calendarViewModel)
            }
        }
    }
}

struct CatButtonView: View {
    let colorName: String
    @ObservedObject var calendarViewModel: CalendarViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                
            },label: {
                ZStack {
                    Color.white
                    Image(systemName: "pawprint.fill")
                        .font(.system(size: 15))
                        .foregroundColor(Color(uiColor: UIColor(named: colorName) ?? UIColor.white))
                }
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .shadow(color: Color(uiColor: .systemGray3), radius: 2)
            })
            Button(action: {
                
            },label: {
                VStack(spacing: 0) {
                    Text("0")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    Spacer().frame(height: 25)
                }
            })
            
        }
        .frame(maxWidth: .infinity)
    }
}

struct CatContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatContainerView(calendarViewModel: CalendarViewModel())
    }
}
