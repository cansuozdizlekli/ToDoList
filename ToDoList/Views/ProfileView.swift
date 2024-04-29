//
//  ProfileView.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/24/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Loading profile..")
                }
            }.navigationTitle("Profile")
        }.onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person")
            .resizable()
            .frame(width: 125,height: 125)
            .foregroundColor(.blue)
            .aspectRatio(contentMode: .fit)
            .padding()
        
        // Info
        VStack {
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
            }.padding()
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
            }.padding()
            HStack {
                Text("Member Since:")
                    .bold()
                Text(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))
            }.padding()
        }.padding()
        
        // Sign out
        
        Button {
            viewModel.logOut()
        }label: {
           Text("log Out")
        }.tint(.red)
            .padding()
    }
}

#Preview {
    ProfileView()
}
