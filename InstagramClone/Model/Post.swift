//
//  Post.swift
//  InstagramClone
//
//  Created by mac on 05.11.2021.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    let imageUrl: String
    let ownerUid: String
    let ownerImageUrl: String
    let ownerUsername: String
    var didLike: Bool? = false
    
    var user: User?
}
