//
//  CommentsCell.swift
//  InstagramClone
//
//  Created by mac on 09.11.2021.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    let comment: Comment
    var body: some View {
        HStack{
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .frame(width: 42, height: 42)
                .clipShape(Circle())
            
            Text(comment.username)
                .font(.system(size: 16, weight: .semibold)) + Text(" \(comment.commentText)")
                .font(.system(size: 15))
                
            Spacer()
            
            Text(" \(timestampString(timestamp: comment.timestamp))")
                .foregroundColor(.gray)
                .font(.system(size: 12))
          
            
        }.padding(.horizontal, 10)
    }
}


