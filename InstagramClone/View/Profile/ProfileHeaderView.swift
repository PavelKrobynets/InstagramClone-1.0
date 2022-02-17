//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by mac on 06.10.2021.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 95, height: 95)
                    .clipShape(Circle())
                
                    Spacer()
                
                HStack(){
                    ProfileInfo(name: "Post", count: viewModel.user.stats?.posts ?? 0)
                    
                ProfileInfo(name: "Followers", count: viewModel.user.stats?.followers ?? 0)
                    
                ProfileInfo(name: "Following", count: viewModel.user.stats?.following ?? 0)
                }
            }
            Text(viewModel.user.fullname)
                .padding(.vertical, 1)
                .font(.system(size: 16, weight: .semibold))
            if let bio = viewModel.user.bio{
                Text(bio)
                    .font(.system(size: 16, weight: .light ))

            }else {
                Text("The smartest witch/witcher in Hogwarts")
                    .font(.system(size: 16, weight: .light ))

            }
            
            ProfileActionButtonView(viewModel: viewModel)
            
        }.padding(.horizontal)
    }
}






