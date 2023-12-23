//
//  CatButtonContainerView.swift
//  SimpleTodo
//
//  Created by yongjun18 on 2023/12/23.
//

import SwiftUI

struct CatButtonContainerView: View {
    var body: some View {
        HStack(spacing: 0) {
            CatButtonView(colorName: "EventColor1")
            CatButtonView(colorName: "EventColor2")
            CatButtonView(colorName: "EventColor3")
            CatButtonView(colorName: "EventColor4")
            CatButtonView(colorName: "EventColor5")
            CatButtonView(colorName: "EventColor6")
        }
    }
}

struct CatButtonView: View {
    let colorName: String
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                
            },label: {
                ZStack {
                    Color.white
                    Image(systemName: "pawprint.fill")
                        .font(.system(size: 15))
                        .foregroundColor(Color(uiColor: UIColor(named: colorName) ?? UIColor.white))
                }
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .shadow(color: Color(uiColor: .systemGray3), radius: 2)
            })
            Button(action: {
                
            },label: {
                VStack(spacing: 0) {
                    Text("0")
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    Spacer().frame(height: 25)
                }
            })
            
        }
        .frame(maxWidth: .infinity)
    }
}

struct CatButtonContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatButtonContainerView()
    }
}
