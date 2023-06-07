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
        
        // weekday view 커스텀
        calendar.appearance.weekdayTextColor = UIColor(red: 136/255.0, green: 136/255.0, blue: 136/255.0, alpha: 1.0) // #888888
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 12)
        
        // 날짜 텍스트 폰트 설정
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 12)
        
        return calendar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct CalendarView: View {
    var body: some View {
        GeometryReader { proxy in
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
                    .frame(width: proxy.size.width, height: 350)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

