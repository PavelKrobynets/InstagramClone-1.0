//
//  UserListView.swift
//  InstagramClone
//
//  Created by mac on 05.10.2021.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    var users : [User]{
        return searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)
    }
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 1){
                ForEach(users) { user in
                    NavigationLink {
                       LazyView( ProfileView(user: user))
                    } label: {
                        UserCell(user: user)
                            .foregroundColor(Color("TextColor"))
                    }
                }
            }
        }
    }
}


