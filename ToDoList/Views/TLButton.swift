//
//  TLButton.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/26/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let bgColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        
    }
}

#Preview {
    TLButton(title:"Value", bgColor: .blue, action: {})
}
