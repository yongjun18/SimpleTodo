//
//  CalendarView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/07.
//

import SwiftUI
import FSCalendar

struct CalendarViewRepresentable: UIViewRepresentable {
    @ObservedObject var calendarViewModel: CalendarViewModel
    
    func makeUIView(context: Context) -> some FSCalendar {
        let calendar = FSCalendar()
        
        calendar.dataSource = calendarViewModel
        calendar.delegate = calendarViewModel
        calendar.register(CalendarCell.self, forCellReuseIdentifier: "cell")
        
        // 오늘 날짜 색상, 선택 날짜 색상을 디폴트 색상으로
        calendar.appearance.titleTodayColor = nil
        calendar.appearance.titleSelectionColor = nil
        
        CalendarCustom.custom(calendar)
        calendar.select(Date())
        Task {
            await MainActor.run {
                calendarViewModel.setTodayMonthString(date: calendar.currentPage)
            }
        }
        return calendar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if calendarViewModel.calendarModel.moveToNextMonthPage {
            // 다음 달 페이지로 이동
            Task {
                await MainActor.run {
                    let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: uiView.currentPage)
                    uiView.setCurrentPage(nextMonth!, animated: true)
                    calendarViewModel.calendarModel.moveToNextMonthPage = false
                }
            }
        }
        
        if calendarViewModel.calendarModel.moveToPrevMonthPage {
            // 이전 달 페이지로 이동
            Task {
                await MainActor.run {
                    let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: uiView.currentPage)
                    uiView.setCurrentPage(previousMonth!, animated: true)
                    calendarViewModel.calendarModel.moveToPrevMonthPage = false
                }
            }
        }
        
        if calendarViewModel.calendarModel.reloadPage {
            // calendar reload 필요
            Task {
                await MainActor.run {
                    uiView.reloadData()
                    calendarViewModel.calendarModel.reloadPage = false
                }
            }
        }
    }
}

struct CalendarView: View {
    @ObservedObject var calendarViewModel: CalendarViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(calendarViewModel.calendarModel.todayMonthString)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 0))
                Spacer()
                Button(action: {
                    calendarViewModel.calendarModel.moveToPrevMonthPage = true
                }, label:{
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16))
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.black)
                })
                Button(action: {
                    calendarViewModel.calendarModel.moveToNextMonthPage = true
                }, label:{
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16))
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.black)
                })
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
            
            CalendarViewRepresentable(calendarViewModel: calendarViewModel)
                .frame(width: UIScreen.main.bounds.width - CalendarCustom.viewPadding * 2,
                       height: CalendarCustom.computeCalendarHeight(width: UIScreen.main.bounds.width - CalendarCustom.viewPadding * 2))
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(calendarViewModel: CalendarViewModel())
    }
}

