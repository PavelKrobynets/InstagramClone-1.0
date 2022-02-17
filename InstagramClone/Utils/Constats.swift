//
//  Constats.swift
//  InstagramClone
//
//  Created by mac on 24.10.2021.
//

import Foundation
import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOW = Firestore.firestore().collection("following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
let COLLECTION_NOTIFICATIONS = Firestore.firestore().collection("notifications")


//let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
//let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
