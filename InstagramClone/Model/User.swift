//
//  User.swift
//  InstagramClone
//
//  Created by mac on 24.10.2021.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
 
struct User: Identifiable,  Decodable{
    let username: String
    let email: String
    let fullname: String
    let profileImageUrl: String
    @DocumentID var id: String?
    var bio: String?
    var isFollowed: Bool? = false
    var stats: UserStats? 
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
    
    
}

struct UserStats: Decodable{
    var following: Int
    var posts: Int
    var followers: Int
}
