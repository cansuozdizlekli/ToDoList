//
//  LoginView.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/24/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: 15,
                           bgColor: .pink)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                //Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                        bgColor: .blue)
                    {
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .scrollContentBackground(.hidden)
                .offset(y: -50)
                    
                    
                
                
                //Create Account
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account",destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewViewModel())
}
