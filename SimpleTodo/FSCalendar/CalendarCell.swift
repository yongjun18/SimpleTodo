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
    
    var sizeRatio: Double = 0.85
    var cornerRatio: Double = 0.06538
    var shadowRatio: Double = 0.05
 
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let selectIndicatorView = UIView(frame: CGRect(x: frame.width * (1.0-sizeRatio) * 0.5,
                                                       y: frame.height * (1.0-sizeRatio) * 0.5,
                                                       width: frame.width * sizeRatio,
                                                       height: frame.height * sizeRatio))
        selectIndicatorView.backgroundColor = UIColor(.white)
        selectIndicatorView.layer.cornerRadius = frame.height * cornerRatio
        
        // 그림자 설정
        selectIndicatorView.layer.shadowOffset = CGSize(width: 0, height: 0)
        selectIndicatorView.layer.shadowOpacity = 0.16
        selectIndicatorView.layer.shadowRadius = frame.height * shadowRatio
        
        self.contentView.insertSubview(selectIndicatorView, at: 1)
        self.selectIndicatorView = selectIndicatorView
        
        // 날짜 선택 시 나타나는 원형 효과 제거
        self.shapeLayer.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.selectIndicatorView.bounds = CGRect(x: frame.width * (1.0-sizeRatio) * 0.5,
                                                 y: frame.height * (1.0-sizeRatio) * 0.5,
                                                 width: frame.width * sizeRatio,
                                                 height: frame.height * sizeRatio)
        self.selectIndicatorView.layer.cornerRadius = frame.height * cornerRatio
        selectIndicatorView.layer.shadowRadius = frame.height * shadowRatio
    }
}
