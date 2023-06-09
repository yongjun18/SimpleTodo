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
    weak var eventIndicatorContainer: EventIndicatorContainer!
    
    var sizeRatio: Double = 0.85
    var cornerRatio: Double = 0.06538
    var shadowRatio: Double = 0.045
 
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
        
        // 그림자 설정
        selectIndicatorView.layer.shadowOffset = CGSize(width: 0, height: 0)
        selectIndicatorView.layer.shadowOpacity = 0.25
        
        self.contentView.insertSubview(selectIndicatorView, at: 1)
        self.selectIndicatorView = selectIndicatorView
        
        let eventIndicatorContainer = EventIndicatorContainer(frame: CGRectZero)
        self.contentView.insertSubview(eventIndicatorContainer, aboveSubview: selectIndicatorView)
        self.eventIndicatorContainer = eventIndicatorContainer
        
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
        
        self.titleLabel.frame = CGRect(x: selectIndicatorView.frame.origin.x,
                                       y: selectIndicatorView.frame.origin.y,
                                       width: selectIndicatorView.frame.width,
                                       height: selectIndicatorView.frame.height * (CalendarCustom.designedTitleLabelHeight / CalendarCustom.designedCellHeight))
        
        // 테스트 용
        let dotCount = Int.random(in: 0...6)
        let activeArr = Array(0..<dotCount)
        setEventIndicator(activeArr: activeArr)
    }
    
    func setEventIndicator(activeArr: [Int]) {
        self.eventIndicatorContainer.setWith(activeArr: activeArr)
        
        let containerX = selectIndicatorView.frame.origin.x + (selectIndicatorView.frame.width - eventIndicatorContainer.frame.width)/2
        let containerY = selectIndicatorView.frame.origin.y + (selectIndicatorView.frame.height * (CalendarCustom.designedEventIndicatorY / CalendarCustom.designedCellHeight))
        eventIndicatorContainer.frame = CGRect(x: containerX, y: containerY,
                                               width: eventIndicatorContainer.frame.width,
                                               height: eventIndicatorContainer.frame.height)
    }
}
