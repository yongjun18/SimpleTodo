//
//  CatContainerModel.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/12/24.
//

import Foundation

struct CatFootprint: Identifiable {
    public static let size = 40.0
    public static let maxNumber = 30
    
    let id = UUID()
    var x: Double = 0.0
    var y: Double = 0.0
    var angle: Double = 0.0
    var colorString: String = ""
}
