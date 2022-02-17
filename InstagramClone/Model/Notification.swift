//
//  Notification.swift
//  InstagramClone
//
//  Created by mac on 13.11.2021.
//

import FirebaseFirestoreSwift
import Firebase

struct Notification : Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var userIsFollowed: Bool? = false
    var post: Post?
    var user: User? 
}

enum NotificationType: Int, Decodable{
    case like
    case comment
    case follow
    
    var notificationMessage: String{
        switch self{
        case .like: return " liked your post"
        case .comment: return " commented your post"
        case .follow: return " started following you"
        }
    }
}
