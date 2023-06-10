//
//  ContentView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/06/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CalendarView()
            .padding(CalendarCustom.viewPadding)
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
