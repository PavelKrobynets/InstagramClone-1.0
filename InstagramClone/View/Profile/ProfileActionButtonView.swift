//
//  ProfileActionButtonView.swift
//  InstagramClone
//
//  Created by mac on 06.10.2021.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel : ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false}
    @State var showEditProfile = false
    var body: some View {
        if viewModel.user.isCurrentUser{
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit profile")
                    .fontWeight(.semibold)
            }.padding()
                .foregroundColor(Color("TextColor"))
                .frame(maxWidth: .infinity,maxHeight: 35 , alignment: .center)
                .cornerRadius(3)
                .border(.gray , width: 1)
                .sheet(isPresented: $showEditProfile) {
                    EditProfileView(user: $viewModel.user)
                }
        }else{
            HStack{
                    Button {
                        isFollowed ? viewModel.unfollow() : viewModel.follow()
                    } label: {
                        Text(isFollowed ? "Following" : "Follow")
                            .fontWeight(.semibold)
                    }.padding()
                    .foregroundColor(isFollowed ? Color("TextColor") : .white)
                        .frame(maxWidth: .infinity,maxHeight: 35 , alignment: .center)
                        .background(isFollowed ? .white : Color("FollowColor"))
                        .border(.gray , width: isFollowed ?  1 : 0)
                        .cornerRadius(4)
                
                Button {
                    //
                } label: {
                    Text("Message")
                        .fontWeight(.semibold)
                }.padding()
                    .foregroundColor(Color("TextColor"))
                    .frame(maxWidth: .infinity,maxHeight: 35 , alignment: .center)
                    .border(.gray , width: 1)
                    .cornerRadius(4)
                    
                    
            }
        }
    
    }
}


