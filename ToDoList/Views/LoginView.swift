//
//  LoginView.swift
//  ToDoList
//
//  Created by Anubhav Tomar on 29/08/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: 15,
                           background: .pink)
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    
                    TLButton(title: "Log In",
                             background: .blue
                    ) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                VStack{
                    Text("New around here ?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView()
                    )
                    .padding(.bottom, 50)
                }
                
                Spacer()
            }.ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
