//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by mac on 21.11.2021.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText: String
    @ObservedObject  var viewModel: EditProfileViewModel
    @Binding var user: User
    @Environment (\.presentationMode) var mode
    init(user: Binding<User>){
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
        
    }
    var body: some View {
        VStack {
            HStack(alignment: .top){
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Button {
                    viewModel.saveUserData(bioText)
                } label: {
                    Text("Done").bold()
                }

            }.padding()
                .padding(.horizontal)
            Text("Add your bio")
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
            
        
                TextEditor(text: $bioText)
                    .frame(width: UIScreen.main.bounds.width - 15 , height: UIScreen.main.bounds.height / 5
                       , alignment: .center)
                
            
               
            
            Spacer()
            
        }.background(Color(.systemGroupedBackground))
            .ignoresSafeArea()
            .onReceive(viewModel.$uploadComplete) { completed in
                if completed{
                self.mode.wrappedValue.dismiss()
                    self.user.bio = viewModel.user.bio
                }
            }
    }
}


