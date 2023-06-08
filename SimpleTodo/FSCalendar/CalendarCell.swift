//
//  CalendarCell.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/08.
//

import Foundation
import FSCalendar

class CalendarCell: FSCalendarCell {
    weak var selectIndicatorView: UIView!
 
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let selectIndicatorView = UIView(frame: CGRect(x: 5, y: 5, width: frame.width-10, height: frame.height-10))
        selectIndicatorView.backgroundColor = UIColor(.white)
        selectIndicatorView.layer.cornerRadius = 4
        
        // 그림자 설정
        selectIndicatorView.layer.shadowOffset = CGSize(width: 0, height: 0)
        selectIndicatorView.layer.shadowOpacity = 0.16
        selectIndicatorView.layer.shadowRadius = 3
        
        self.contentView.insertSubview(selectIndicatorView, at: 0)
        self.selectIndicatorView = selectIndicatorView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.selectIndicatorView.bounds = CGRect(x: 5, y: 5,
                                                 width: self.contentView.bounds.width-10,
                                                 height: contentView.bounds.height-10)
    }
}
