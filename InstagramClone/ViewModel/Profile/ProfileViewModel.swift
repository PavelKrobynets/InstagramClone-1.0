//
//  ProfileViewModel.swift
//  InstagramClone
//
//  Created by mac on 29.10.2021.
//

import SwiftUI

class ProfileViewModel: ObservableObject{
    @Published var user: User
    
    init(user: User){
        self.user = user
        checkIfUserFollowed()
        fetchUserStats()
    }
    
    func follow(){
        guard let uid = user.id else { return }
        FollowControl.follow(uid: uid) { _ in
            self.user.isFollowed = true
            NotificationsViewModel.uploadNotification(to: uid, type: .follow, post: nil)
        }
    }
    
    func unfollow(){
        guard let uid = user.id else { return }
        FollowControl.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserFollowed(){
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        FollowControl.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserStats(){
        guard let uid = user.id else { return }
        
        COLLECTION_FOLLOW.document(uid).collection("user-following").getDocuments { snapshot, _ in
            guard let following = snapshot?.documents.count else { return }
            
            COLLECTION_FOLLOW.document(uid).collection("user-followers").getDocuments { snapshot, _ in
                guard let followers = snapshot?.documents.count else { return }
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                    guard let posts = snapshot?.documents.count else { return }
                    
                    
                    self.user.stats = UserStats(following: following, posts: posts, followers: followers)
                   
                }
            }
        }
    }
}
