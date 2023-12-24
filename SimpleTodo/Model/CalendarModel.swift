//
//  CalendarModel.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/12/23.
//

import Foundation

struct CalendarModel {
    var moveToNextMonthPage: Bool = false
    var moveToPrevMonthPage: Bool = false
    
    var todayMonthString: String = ""
    
    var eventCountArr: [Int] = [0, 0, 0, 0, 0, 0]
    var selectedDateString: String = ""
}
