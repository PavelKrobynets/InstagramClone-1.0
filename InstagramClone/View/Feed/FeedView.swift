//
//  FeedView.swift
//  InstagramClone
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 35) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel:  FeedCellViewModel(post: post))
                }
            }.padding(.top)
        }.navigationBarTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
    
}
}


