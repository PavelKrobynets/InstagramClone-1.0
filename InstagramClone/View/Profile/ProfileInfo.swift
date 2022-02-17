//
//  ProfileInfo.swift
//  InstagramClone
//
//  Created by mac on 06.10.2021.
//

import SwiftUI

struct ProfileInfo: View {
    var name: String
    var count: Int
    var body: some View {
        VStack{
            Text("\(count)")
                .fontWeight(.semibold)
            Text(name)
                
        }.frame(width: 80)
            
    }
}


