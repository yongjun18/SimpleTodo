//
//  ContentView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            CalendarView()
                .padding(CalendarCustom.viewPadding)
            ZStack {
                CardContainerView()
            }
            .padding(EdgeInsets(top: 24, leading: 0, bottom: 60, trailing: 0))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
