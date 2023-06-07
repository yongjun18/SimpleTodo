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

