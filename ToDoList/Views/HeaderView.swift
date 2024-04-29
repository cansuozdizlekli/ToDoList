//
//  HeaderView.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/25/24.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subtitle : String
    let angle : Double
    let bgColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bgColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 80)
        }
        .offset(y: -150)
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, bgColor: .blue)
}
