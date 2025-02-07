//
//  Login.swift
//  Kairos
//
//  Created by Jaime Almeida on 2/3/25.
//
import SwiftUI

struct Login: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showSignup: Bool = false // State to toggle between Login and SignUp views
    @State private var showForgotPasswordSheet: Bool = false // State to show Forgot Password Sheet

    var body: some View {
        ZStack {
            // Background color
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            // Circle animation
            CircleView(showSignup: showSignup)
                .animation(.easeInOut(duration: 0.3), value: showSignup)
            
            if showSignup {
                // Show the SignUp screen
                SignUp(showSignup: $showSignup)
                    .transition(.move(edge: .trailing)) // Smooth slide-in animation for SignUp
            } else {
                // Show the Login screen
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Login")
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                        .foregroundStyle(Color("primaryAccent"))
                    
                    Text("Please sign in to use Kairos")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("secondaryAccent"))
                        .padding(.top, -5)
                    
                    VStack(spacing: 25) {
                        // Text fields for email and password
                        CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                        CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                            .padding(.top, 5)
                            .padding(.top, 20)
                        
                        // Forgot Password Button
                        Button("Forgot Password?") {
                            showForgotPasswordSheet = true // Show the sheet
                        }
                        .font(.callout)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color("primaryAccent"))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        // Login Button
                        GradientButton(title: "Login", icon: "arrow.right") {
                            // Add login logic here
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .disabled(emailID.isEmpty || password.isEmpty)
                        .opacity(emailID.isEmpty || password.isEmpty ? 0.5 : 1.0)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    HStack(spacing: 6) {
                        Text("Don't have an account?")
                            .foregroundStyle(.gray)
                        
                        Button("Sign Up") {
                            withAnimation {
                                showSignup = true // Switch to SignUp view
                            }
                        }
                        .fontWeight(.bold)
                        .foregroundStyle(Color("primaryAccent"))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
                .transition(.move(edge: .leading)) // Smooth slide-out animation for Login
            }
        }
        // Present the Forgot Password Sheet
        .sheet(isPresented: $showForgotPasswordSheet) {
            ForgotPasswordSheet()
        }
    }

    @ViewBuilder
    func CircleView(showSignup: Bool) -> some View {
        Circle()
            .fill(.linearGradient(colors: [Color("primaryAccent"), Color("secondaryAccent")], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
            .offset(x: showSignup ? 90 : -270, y: showSignup ? -90 : -90) // Animate position
            .blur(radius: showSignup ? 15 : 15) // Animate blur
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}

struct ForgotPasswordSheet: View {
    // Independent email binding 
    @State private var emailID: String = ""
    var body: some View {
        VStack {
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .foregroundStyle(Color("primaryAccent"))

            Text("Enter your email address to reset your password")
                .font(.body)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .foregroundStyle(Color("secondaryAccent"))

            // Email field
            CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                .padding(.vertical, 20)

            // Reset Password Button
            GradientButton(title: "Reset Password", icon: "arrow.right") {
                // Add reset password logic here
                print("Reset password for \(emailID)")
            }
            .disabled(emailID.isEmpty)
            .opacity(emailID.isEmpty ? 0.5 : 1.0)

            Spacer()
        }
        .padding()
        .presentationDetents([.medium]) // Optional: Control sheet size
    }
}

struct SignUp: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    @Binding var showSignup: Bool // Binding to toggle back to Login

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Sign Up")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundStyle(Color("primaryAccent"))
            
            Text("Create a new account for Kairos")
                .fontWeight(.semibold)
                .foregroundStyle(Color("secondaryAccent"))
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                // Text fields for name, email, and password
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                
                // Sign Up Button
                GradientButton(title: "Sign Up", icon: "arrow.right") {
                    // Add sign-up logic here
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .disabled(emailID.isEmpty || password.isEmpty)
                .opacity(emailID.isEmpty || password.isEmpty ? 0.5 : 1.0)
            }
            .padding(.top, 20)
            
            Spacer()
            
            HStack(spacing: 6) {
                Text("Already have an account?")
                    .foregroundStyle(.gray)
                
                Button("Login") {
                    withAnimation {
                        showSignup = false // Switch back to Login view
                    }
                }
                .fontWeight(.bold)
                .foregroundStyle(Color("primaryAccent"))
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .transition(.move(edge: .trailing)) // Smooth slide-in animation for SignUp
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
