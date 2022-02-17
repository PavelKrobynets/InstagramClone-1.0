//
//  UserService.swift
//  InstagramClone
//
//  Created by mac on 29.10.2021.
//

import Firebase
typealias FirestoreCompletion = ((Error?)-> Void)?

struct FollowControl {
    static func follow(uid: String, completion: ((Error?)-> Void)?){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
//        COLLECTION_FOLLOWING.document(currentUid)
//            .collection("user-following").document(uid).setData([:]) { _ in
//                COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
//                    .document(currentUid).setData([:], completion: completion)
//            }
        
        COLLECTION_FOLLOW.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLOW.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
            
           
        }
 
    }
    
    static func unfollow(uid: String, completion: ((Error?)-> Void)?){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOW.document(currentUid).collection("user-following").document(uid).delete { _ in
            COLLECTION_FOLLOW.document(uid).collection("user-followers").document(currentUid).delete(completion: completion)
        }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool)->Void){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOW.document(currentUid).collection("user-following").document(uid).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            completion(isFollowed)
        }
    }
}
