//
//  NotificationsViewModel.swift
//  InstagramClone
//
//  Created by mac on 13.11.2021.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject{
    @Published var notifications = [Notification]()
    @Published var currentNotification: Notification?
    init(){
        fetchNotifications()
    }
    static let shared = NotificationsViewModel()
    static func uploadNotification(to uid: String, type: NotificationType, post: Post? = nil){
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let notify = NotificationsViewModel.shared.currentNotification else { return }
        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "uid": user.id ?? "",
                                   "profileImageUrl": user.profileImageUrl,
                                   "type": type.rawValue,
                                   "id": notify.id ?? ""]
        
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        if uid != user.id{
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
        }
    }
    
 
     
    func fetchNotifications(){
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.notifications = documents.compactMap({try? $0.data(as: Notification.self)})
            
        }
    }
}
