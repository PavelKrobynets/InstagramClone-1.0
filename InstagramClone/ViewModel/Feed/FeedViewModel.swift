//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by mac on 05.11.2021.
//

import SwiftUI
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    init(){
        fetchPosts()
    }
    
    func fetchPosts(){
        let query = COLLECTION_POSTS.order(by: "timestamp", descending: true)
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
            
//            documents.forEach { snapshot in
//                guard let post = try? snapshot.data(as: Post.self) else { return }
//                self.posts.append(post)
//            }
        }
    }
    
}
