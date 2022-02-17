//
//  NotificationCell.swift
//  InstagramClone
//
//  Created by mac on 05.10.2021.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @State private var showPostImage = false
    @ObservedObject var viewModel: NotificationCellViewModel
    var isFollowed: Bool { return viewModel.notification.userIsFollowed ?? false}
    init(viewModel: NotificationCellViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        HStack{
            if let user = viewModel.notification.user{
                NavigationLink {
                    ProfileView(user: user)
                } label: {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    
                    Text(viewModel.notification.username)
                        .font(.system(size: 14, weight: .semibold)) + Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size: 13, weight: .regular)) + Text(" \(timestampString(timestamp:viewModel.notification.timestamp))")
                        .foregroundColor(.gray).font(.system(size: 10))
                        .font(.system(size: 14))
                }.foregroundColor(Color("TextColor"))
            }

                
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post{
                    NavigationLink {
                        FeedCell(viewModel: FeedCellViewModel(post: post))
                    } label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipped()
                    }

                }
            }else{
                Button {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .frame(width: 100, height: 32)
                        
                }
                .background(isFollowed ? Color.white : Color("FollowColor"))
                .foregroundColor(isFollowed ? .black : .white)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.gray, lineWidth: isFollowed ? 1 : 0))
                    .font(.system(size: 15, weight: .semibold))

            }
        }.padding(.horizontal, 9)
    }
}


