//
//  CalendarView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/07.
//

import SwiftUI
import FSCalendar

struct CalendarViewRepresentable: UIViewRepresentable {
    let datasource = CalendarDataSource()
    let delegate = CalendarDelegate()
    
    func makeUIView(context: Context) -> some UIView {
        let calendar = FSCalendar()
        calendar.dataSource = datasource
        calendar.delegate = delegate
        
        // header 숨기기
        calendar.calendarHeaderView.isHidden = true
        calendar.headerHeight = 0
        
        // weekday 컬러 #888888
        calendar.appearance.weekdayTextColor = UIColor(red: 136/255.0, green: 136/255.0, blue: 136/255.0, alpha: 1.0)
        
        return calendar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct CalendarView: View {
    var body: some View {
        GeometryReader { proxy in
            CalendarViewRepresentable()
                .frame(width: proxy.size.width, height: 400)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

