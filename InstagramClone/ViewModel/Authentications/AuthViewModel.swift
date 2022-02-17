//
//  AuthViewModel.swift
//  InstagramClone
//
//  Created by mac on 19.10.2021.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var didSendResetPasswordLink = false
    static let shared = AuthViewModel()
    
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed login \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    
    }
    
    func register(withEmail email: String, password: String,
                  image: UIImage?, fullname: String, username: String) {
        guard let image = image else { return }

        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                if let error = error {
                    print("DEBUG : Failed register \(error.localizedDescription)")
                    return
                }
                
                guard let user = result?.user else { return }
                
                print("successfully register user")
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
    }
    
    func singOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("DEBUG: error \(error.localizedDescription)")
                return
            }
            self.didSendResetPasswordLink = true
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
