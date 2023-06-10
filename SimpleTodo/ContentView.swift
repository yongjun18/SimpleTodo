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
            .padding(EdgeInsets(top: 24, leading: CalendarCustom.viewSidePadding,
                                bottom: 0, trailing: CalendarCustom.viewSidePadding))
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
