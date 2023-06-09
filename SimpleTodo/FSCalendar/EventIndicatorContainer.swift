//
//  EventIndicatorContainer.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/09.
//

import Foundation
import UIKit

class EventIndicatorContainer: UIView {
    let eventColor = [ UIColor(named:"EventColor1"), UIColor(named:"EventColor2"),
                       UIColor(named:"EventColor3"), UIColor(named:"EventColor4"),
                       UIColor(named:"EventColor5"), UIColor(named:"EventColor6") ]
    var eventDotViews: [UIView] = []
    let eventDotSize = 6
    let eventDotRadius = 2.0
    
    required init!(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        for i in 0..<eventColor.count {
            let eventDotView = UIView(frame: CGRect(x: 0, y: 0, width: eventDotSize, height: eventDotSize))
            eventDotView.backgroundColor = eventColor[i]
            eventDotView.layer.cornerRadius = eventDotRadius
            eventDotView.isHidden = true
            self.insertSubview(eventDotView, at: i)
            eventDotViews.append(eventDotView)
        }
    }
    
    func setWith(activeArr: [Int]) {
        let sortedArr = activeArr.sorted()
        var deduplicatedArr: [Int] = []
        var dx: Int
        var nowX: Int
        
        // 중복 제거
        for i in 0..<sortedArr.count {
            if i==0 {
                deduplicatedArr.append(sortedArr[i])
            }
            else {
                if sortedArr[i-1] != sortedArr[i] {
                    deduplicatedArr.append(sortedArr[i])
                }
            }
        }
        
        // event dot 모두 hidden 처리
        for dotView in eventDotViews {
            dotView.isHidden = true
        }
        
        // 사용할 event dot 모두 hidden 해제 및 배치
        dx = 6
        if deduplicatedArr.count > 4 { dx = 4 }
        nowX = 0
        for i in deduplicatedArr {
            eventDotViews[i].frame = CGRect(x: nowX, y: 0, width: eventDotSize, height: eventDotSize)
            eventDotViews[i].isHidden = false
            nowX += dx
        }
        self.frame = CGRect(x: Int(self.frame.origin.x), y: Int(self.frame.origin.y),
                            width: nowX - dx + eventDotSize, height: eventDotSize)
    }
}
