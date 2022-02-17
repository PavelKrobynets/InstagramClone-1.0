//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by mac on 30.09.2021.
//

import SwiftUI
import Firebase

@main
struct InstagramCloneApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
