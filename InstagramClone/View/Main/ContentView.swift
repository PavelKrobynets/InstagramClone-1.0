//
//  ContentView.swift
//  InstagramClone
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View{
        Group{
            if viewModel.userSession == nil{
                LoginView()
            }
            else {
                if let user = viewModel.currentUser{
                    MainTabView(user: user)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
