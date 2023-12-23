//
//  CatContainerView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/12/23.
//

import SwiftUI

struct CatContainerView: View {
    var body: some View {
        VStack(spacing: 0) {
            Color.white //TODO: CatScreenView 구현 및 적용
            CatButtonContainerView()
        }
    }
}

struct CatContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatContainerView()
    }
}
