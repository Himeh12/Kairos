//
//  CustomTF.swift
//  Kairos
//
//  Created by Jaime Almeida on 2/4/25.
//
import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = Color("primaryAccent")
    var hint: String
    // Hide text field for password
    var isPassword: Bool = false
    @Binding var value: String
    // View Properties
    @State private var showPassword: Bool = false
    
    var body: some View{
        HStack(alignment: .top, spacing: 8, content:{
            Image(systemName: sfIcon)
                .foregroundStyle(Color("primaryAccent"))
            
                // Maintain widths for both text fields
                .frame(width: 30)
                .offset(CGSize(width:  0, height: 2))
            
            VStack(alignment: .leading, spacing: 8, content: {
                // Use secureField to blur text if it is password
                if isPassword{
                    Group{
                        //Show password when user wants to show password
                        if showPassword{
                            TextField(hint, text: $value)
                        } else{
                            SecureField(hint, text: $value)

                        }
                    }
                    // Reveal Password
                    .overlay(alignment: .trailing){
                        Button(action: {
                            withAnimation {
                                showPassword.toggle()
                            }
                        }, label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundStyle(Color("secondaryAccent"))
                                .padding(10)
                                .contentShape(.rect)
                            
                        })
                    }
                } else{
                    TextField(hint, text: $value)
                }
                
                Divider()
            })
            

        })
        
    }
    
}
