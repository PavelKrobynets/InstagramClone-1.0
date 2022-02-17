//
//  FeedCell.swift
//  InstagramClone
//
//  Created by mac on 03.10.2021.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel : FeedCellViewModel
    var didLike: Bool { return viewModel.post.didLike ?? false}
    
    init(viewModel: FeedCellViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                if let user = viewModel.post.user{
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        KFImage(URL(string: viewModel.post.ownerImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 33, height: 33)
                            .clipShape(Circle())
                        Text(viewModel.post.ownerUsername)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("TextColor"))
                            
                    }
                }

            }.padding(.leading, 5)
            
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 440)
            
            
            HStack(spacing: 20){
                Button {
                    didLike ? viewModel.unlike() : viewModel.like()
                } label: {
                    Image(systemName: didLike  ? "heart.fill" : "heart")
                        .foregroundColor(withAnimation{didLike ?  Color.red : Color("TextColor")})
                }
                NavigationLink {
                    CommentsView(post: viewModel.post)
                } label: {
                    Image(systemName: "captions.bubble")
                }

                Button {
                    //
                } label: {
                    Image(systemName: "paperplane")
                }

               
            }.foregroundColor(Color("TextColor"))
                .padding(4)
            
            Text(viewModel.post.likes == 1 ? "\(viewModel.post.likes) like" : "\(viewModel.post.likes) likes")
                .font(.system(size: 14, weight: .bold ))
                .padding(.leading, 7)
                .padding(.bottom, 1)
            
            HStack{
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold)) + Text(" \(viewModel.post.caption)")
                    .font(.system(size: 13))
            }.padding(.horizontal , 6)
            
            Text(timestampString(timestamp: viewModel.post.timestamp))
                .font(.system(size: 12))
                .foregroundColor(Color(.lightGray))
                .padding(.leading, 6)
        }
    }
}


