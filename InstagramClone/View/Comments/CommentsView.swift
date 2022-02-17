//
//  CommentsView.swift
//  InstagramClone
//
//  Created by mac on 09.11.2021.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText =  ""
    @ObservedObject var viewModel: CommentsViewModel
    init(post: Post){
        self.viewModel = CommentsViewModel(post: post)
    }
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.comments){ comment in
                        CommentsCell(comment: comment)
                            .padding(.top, 3)
                        
                    }
                }
            }
            
            CustomInputView(inputText: $commentText, placeholder: "Comment", action: uploadComment)
        }
    }
    func uploadComment(){
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}


