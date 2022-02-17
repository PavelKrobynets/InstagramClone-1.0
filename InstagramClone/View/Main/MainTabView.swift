//
//  MainTabView.swift
//  InstagramClone
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct MainTabView: View {
   
    let user : User
    @Namespace var animation
    @State var currentTab : Tabs = .Feed
    var body: some View {
        NavigationView {
            VStack{
                TabView(selection: $currentTab){
                    FeedView()
                        .tag(Tabs.Feed)
                        .navigationBarTitle(currentTab.tabName)
                    
                    SearchView()
                        .tag(Tabs.Search)
                        .navigationBarTitle(currentTab.tabName)
                    
                    UploadPostView(selectedTab: $currentTab)
                        .tag(Tabs.Upload)
                        .navigationBarTitle(currentTab.tabName)
                    
                    NotificationsView()
                        .tag(Tabs.Notifications)
                        .navigationBarTitle(currentTab.tabName)
                    
                    ProfileView(user: user)
                        .tag(Tabs.Profile)
                        .navigationBarTitle(currentTab.tabName)
                    
                }.tabViewStyle(.page(indexDisplayMode: .never ))
                
               CustomTabBar(animation: animation, currentTab: $currentTab)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                
                
            }
                .navigationBarItems(leading: logoutButton)
                .navigationBarTitleDisplayMode(.inline)
                
        }
    }
    var logoutButton : some View {
        Button {
            AuthViewModel.shared.singOut()
        } label: {
            Text("Logout")
                .foregroundColor(Color("TextColor"))
                .fontWeight(.semibold)
        }

    }
}






