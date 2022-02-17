//
//  UserCell.swift
//  InstagramClone
//
//  Created by mac on 05.10.2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user : User
    var body: some View {
        HStack{
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                
            VStack(alignment: .leading){
                Text(user.username)
                    .bold()
                Text(user.fullname)
            }.font(.system(size: 13))
            Spacer()
        }.padding(.leading)
            .padding(.vertical, 10)
    }
}


