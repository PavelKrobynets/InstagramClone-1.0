//
//  SearchView.swift
//  InstagramClone
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var isEditing = false
    @ObservedObject var viewModel = SearchViewModel()
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText, isEditing: $isEditing)
                .padding()
//            PostGridView()
            if isEditing {  UserListView(viewModel: viewModel, searchText: $searchText)    }
            
            else {   PostGridView(config: .search)   }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
