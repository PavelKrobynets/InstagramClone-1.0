//
//  Comments.swift
//  InstagramClone
//
//  Created by mac on 09.11.2021.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Decodable{
    @DocumentID var id: String?
    let commentText: String
    let postOwnerUid: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let uid : String
    let username: String
    
}
