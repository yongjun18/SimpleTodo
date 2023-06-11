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
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                Button(action: {
                    
                }, label:{
                    ZStack {
                        Color.black
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                            .frame(width: 48, height: 48)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 48, height: 48)
                    .cornerRadius(24)
                })
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 24))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
