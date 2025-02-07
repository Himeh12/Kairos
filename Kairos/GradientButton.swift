//
//  GradientButton.swift
//  Kairos
//
//  Created by Jaime Almeida on 2/5/25.
//

import SwiftUI

struct GradientButton: View{
    var title: String
    var icon: String
    var onClick: () -> ()
    var body: some View{
        Button(action: onClick, label: {
            HStack(spacing: 15){
                Text(title)
                Image(systemName: icon)
            }
            
            .fontWeight(.bold)
            .foregroundStyle(Color("background"))
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.linearGradient(colors: [Color("primaryAccent"), Color("secondaryAccent")], startPoint: .top, endPoint: .bottom), in: .capsule)
            
        })
    }
    #Preview{
        ContentView()
    }
}
