//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by mac on 08.11.2021.
//

import SwiftUI
class FeedCellViewModel: ObservableObject{
    @Published var post: Post
 
    
    init(post: Post){
        self.post = post
        isLiked()
        fetchUserFeed()
    }
    
    
    func like() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(currentUid).setData([:]) { _ in
            COLLECTION_USERS.document(currentUid).collection("user-likes").document(postId).setData([:]) { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                
                self.post.didLike = true
                self.post.likes += 1
                
                NotificationsViewModel.uploadNotification(to: self.post.ownerUid,
                                                          type: .like,
                                                          post: self.post)
            }
        }
    }
    
    func unlike() {
        guard post.likes > 0 else { return }
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(currentUid).delete() { _ in
            COLLECTION_USERS.document(currentUid).collection("user-likes").document(postId).delete() { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                
                self.post.didLike = false
                self.post.likes -= 1
                
               
            }
        }
        
    }
    
    func isLiked(){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(currentUid).collection("user-likes").document(postId).getDocument { [self] snapshot, _ in
            guard let isLiked = snapshot?.exists else { return }
            self.post.didLike = isLiked
            
        }
        
    }
    func fetchUserFeed(){
        COLLECTION_USERS.document(post.ownerUid).getDocument { snapshot, _ in
            self.post.user = try? snapshot?.data(as: User.self)
        }
    }
}


