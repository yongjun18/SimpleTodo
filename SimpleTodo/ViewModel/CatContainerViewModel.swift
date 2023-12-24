//
//  CatContainerViewModel.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/12/24.
//

import Foundation

class CatContainerViewModel: ObservableObject {
    @Published var catFootprintArr = [CatFootprint]()
    
    // 랜덤한 footprint 생성
    func addRandomFootprint(colorString: String) {
        var newFootprint = CatFootprint()
        newFootprint.colorString = colorString
        newFootprint.x = Double.random(in: 0..<1)
        newFootprint.y = Double.random(in: 0..<1)
        newFootprint.angle = Double.random(in: 0..<2*Double.pi)
        
        catFootprintArr.append(newFootprint)
        
        // 100개를 넘어서면, 제일 오래된 것 제거
        if catFootprintArr.count > 100 {
            catFootprintArr.remove(at: 0)
        }
    }
}
