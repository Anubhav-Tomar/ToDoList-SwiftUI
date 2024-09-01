//
//  ProfileView.swift
//  ToDoList
//
//  Created by Anubhav Tomar on 29/08/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                profile(user: user)
            } else {
                Text("Loading Profile..")
            }
        }
        .navigationTitle("Profile")
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        List{
            Section ("Profile"){
                HStack {
                    Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack (alignment: .leading, spacing: 4) {
                        Text(user.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(user.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
            Section ("General") {
                HStack {
                    SettingRowView(imageName: "gear",
                                   title: "Version",
                                   tintColor: Color(.systemGray))
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Section("Account") {
                
                Button {
                    viewModel.logOut()
                } label: {
                    SettingRowView(imageName: "arrow.left.circle.fill",
                                   title: "Sign out",
                                   tintColor: .red)
                }
                
                Button {
                    print("Delete account..")
                } label: {
                    SettingRowView(imageName: "xmark.circle.fill",
                                   title: "Delete Account",
                                   tintColor: .red)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
