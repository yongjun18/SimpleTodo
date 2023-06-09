//
//  CalendarView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/07.
//

import SwiftUI
import FSCalendar

struct CalendarViewRepresentable: UIViewRepresentable {
    var calendarViewModel = CalendarViewModel()
    
    func makeUIView(context: Context) -> some UIView {
        let calendar = FSCalendar()
        
        calendar.dataSource = calendarViewModel
        calendar.delegate = calendarViewModel
        calendar.register(CalendarCell.self, forCellReuseIdentifier: "cell")
        
        // 오늘 날짜 색상, 선택 날짜 색상을 디폴트 색상으로
        calendar.appearance.titleTodayColor = nil
        calendar.appearance.titleSelectionColor = nil
        
        CalendarCustom.custom(calendar)
        calendar.select(Date())
        return calendar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct CalendarView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("2023. 06")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 0))
                Spacer()
                Button(action: {
                    
                }, label:{
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.black)
                })
                Button(action: {
                    
                }, label:{
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16))
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.black)
                })
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
            
            CalendarViewRepresentable()
                .frame(width: UIScreen.main.bounds.width - CalendarCustom.viewPadding * 2,
                       height: CalendarCustom.computeCalendarHeight(width: UIScreen.main.bounds.width - CalendarCustom.viewPadding * 2))
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

