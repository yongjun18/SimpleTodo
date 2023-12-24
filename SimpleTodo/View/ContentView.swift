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
                .padding(EdgeInsets(top: CalendarCustom.viewPadding, leading: CalendarCustom.viewPadding,
                                    bottom: 0, trailing: CalendarCustom.viewPadding))
            CatContainerView(calendarViewModel: calendarViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
