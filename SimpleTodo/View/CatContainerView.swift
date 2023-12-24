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
                }
            }
        }
    }
}

struct CatButtonView: View {
    let index: Int
    @ObservedObject var calendarViewModel: CalendarViewModel
    @ObservedObject var catContainerViewModel: CatContainerViewModel
    
    var body: some View {
        VStack {
            Spacer()
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
            Button(action: {
                calendarViewModel.increaseCounter(index: index, diff: -1)
            },label: {
                VStack(spacing: 0) {
                    Text("\(calendarViewModel.calendarModel.eventCountArr[index])")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    Spacer().frame(height: 25)
                }
            })
            
        }
        .frame(maxWidth: .infinity)
    }
}

struct CatScreenView: View {
    @ObservedObject var catContainerViewModel: CatContainerViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(catContainerViewModel.catFootprintArr) { footprint in
                
            }
        }
    }
}


struct CatContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatContainerView(calendarViewModel: CalendarViewModel())
    }
}
