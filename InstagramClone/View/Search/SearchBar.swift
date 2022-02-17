//
//  SearchBar.swift
//  InstagramClone
//
//  Created by mac on 05.10.2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack{
            Label {
                TextField("Search", text: $text)
            } icon: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
            }.padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .onTapGesture {
                    isEditing = true
                }
            
            if isEditing{
                Button(action:{
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                } ){
                    Image(systemName: "x.circle")
                        .frame(width: 15, height: 10)
                        .foregroundColor(Color(.darkGray))
                }.padding(.trailing, 8)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
            }
        }
    }
}



struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("text"), isEditing: .constant(false))
    }
}
