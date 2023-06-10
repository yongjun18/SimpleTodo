//
//  CalendarViewModel.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/07.
//

import Foundation
import FSCalendar

class CalendarViewModel: NSObject, FSCalendarDelegate, FSCalendarDataSource {
    
    // MARK:- FSCalendarDelegate
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // 선택한 날짜가 이전 또는 다음 페이지라면, 해당 페이지로 이동
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
        
        if let cell = calendar.cell(for: date, at: monthPosition) as? CalendarCell {
            cell.selectIndicatorView.isHidden = false
        }
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if let cell = calendar.cell(for: date, at: monthPosition) as? CalendarCell {
            cell.selectIndicatorView.isHidden = true
        }
        
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        if let calendarCell = cell as? CalendarCell {
            // 선택 여부에 따라 selectedIndicator 히든 설정 변경
            if date == calendar.selectedDate {
                calendarCell.selectIndicatorView.isHidden = false
            }
            else {
                calendarCell.selectIndicatorView.isHidden = true
            }
            
            // 테스트 용
            let dotCount = Int.random(in: 0...6)
            calendarCell.activeArr = Array(0..<dotCount)
        }
    }
    
    // MARK:- FSCalendarDataSource
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        return cell
    }
}

class CalendarCustom {
    public static let padding = 5.0                     // FSCalendar 라이브러리에 정의된 padding 값
    public static let headerHeight = 0.0                // header 사용하지 않음
    public static let weekdayHeight = 24.0              // weeday view height
    public static let designedCellHeight = 52.0         // 디자인 상의 cell height
    public static let designedCellWidth = 42.0          // 디자인 상의 cell width
    public static let designedTitleLabelHeight = 40.0   // 디자인 상의 title label height
    public static let designedEventIndicatorY = 32.0    // 디자인 상의 indicator y 좌표
    
    // 디자인 된 셀의 비율을 유지하기 위해, 세팅해야할 calendar height 계산
    static func computeCalendarHeight(width: Double) -> Double {
        let cellWidth = width/7
        
        // _preferredRowHeight = (self.transitionCoordinator.cachedMonthSize.height-headerHeight-weekdayHeight-padding*2)/6.0
        // _preferredRowHeight/cellWidth == designedCellHeight/designedCellWidth
        // cachedMonthSize는 아래 식으로 계산
        return (designedCellHeight / designedCellWidth) * cellWidth * 6
            + headerHeight + weekdayHeight + padding*2
    }
    
    static func custom(_ calendar: FSCalendar) {
        // locale 한국으로 설정
        calendar.locale = Locale(identifier: "ko_KR")
        
        // header 숨기기
        calendar.calendarHeaderView.isHidden = true
        calendar.headerHeight = headerHeight
        
        // weekday view 커스텀
        calendar.appearance.weekdayTextColor = UIColor(red: 136/255.0, green: 136/255.0, blue: 136/255.0, alpha: 1.0) // #888888
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 12)
        calendar.weekdayHeight = weekdayHeight
        
        // 날짜 텍스트 폰트 설정
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 12)
    }
}
