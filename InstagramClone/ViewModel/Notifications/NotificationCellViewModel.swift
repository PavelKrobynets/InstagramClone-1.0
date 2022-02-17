//
//  NotificationCellViewModel.swift
//  InstagramClone
//
//  Created by mac on 18.11.2021.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject{
    @Published var notification: Notification
    
 

    
    init(notification: Notification){
        self.notification = notification
        checkIfUserFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    func follow(){
        FollowControl.follow(uid: notification.uid) { _ in
            self.notification.userIsFollowed = true
            NotificationsViewModel.uploadNotification(to: self.notification.uid, type: .follow, post: nil)
        }
    }
    
    func unfollow(){
        FollowControl.unfollow(uid: notification.uid) { _ in
            self.notification.userIsFollowed = false
        }
    }
    
    func checkIfUserFollowed(){
        guard notification.type == .follow else { return }
        FollowControl.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.userIsFollowed = isFollowed
        }
    }
    func fetchNotificationPost(){
        guard let postId = notification.postId else { return }
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
    }
    func fetchNotificationUser(){
        COLLECTION_USERS.document(notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: User.self)
        }
    }
}
