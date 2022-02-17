//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by mac on 25.10.2021.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({try? $0.data(as: User.self) })
            
            
            
//          the same code but longer
//            documents.forEach { snapshot in
//                guard let user = try? snapshot.data(as: User.self) else { return }
//                self.users.append(user)
//            }
        }
    }

    
    func filterUsers (_ query: String) -> [User]{
        let lowercasedQuery = query.lowercased()
        return users.filter { $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) }
    }
}
