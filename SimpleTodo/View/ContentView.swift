//
//  ContentView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calendarViewModel = CalendarViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            CalendarView(calendarViewModel: calendarViewModel)
                .padding(CalendarCustom.viewPadding)
            CatContainerView(calendarViewModel: calendarViewModel)
                .padding(EdgeInsets(top: 0, leading: CalendarCustom.viewPadding, bottom: 0, trailing: CalendarCustom.viewPadding))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
