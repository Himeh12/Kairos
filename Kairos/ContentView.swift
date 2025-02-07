//
//  ContentView.swift
//  Kairos
//
//  Created by Jaime Almeida on 2/3/25.
//

import SwiftUI

enum SheetTypes: Identifiable {
    case login
    
    // Each case needs a unique `id`
    var id: String {
        switch self {
        case .login:
            return "login"
        }
    }
}


struct ContentView: View {
    @State private var activeSheet: SheetTypes?
    
    var body: some View {
        ZStack{
            // Ensure background color covers screen
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            // Vstack containing main content for this page
            VStack {
                
                // Two spacers to center logo in the middle
                Spacer()
                // Primary Logo and text for Kairos
                Image(systemName: "graduationcap.fill")
                    // Make image resizable
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundStyle(Color("primaryAccent"))
                Text("Kairos")
                    .foregroundStyle(Color("primaryAccent"))
                    .font(.system(.largeTitle))
                    .fontWeight(.semibold)
                Spacer()
                
                // Allow users to navigate to create an account
                GradientButton(title: "Get Started", icon: "arrow.right"){
                    activeSheet = .login
                }

            }
            .padding()
        }
        
        // Attach the sheet to the `ContentView`
        .sheet(item: $activeSheet) { sheetType in
            switch sheetType {
            case .login:
                Login() // Your Login page
            }
        }
    }
}
#Preview {
    ContentView()
}
