//
//  ResetPasswordView.swift
//  InstagramClone
//
//  Created by mac on 18.10.2021.
//

import SwiftUI

struct ResetPasswordView: View {
    
    var gradient = Gradient(colors: [Color("CircleTabColor"), Color("FollowColor")])
    @Environment (\.presentationMode) var mode
    @EnvironmentObject var viewModel : AuthViewModel
    @State var email: String
    
 
    var body: some View {
        ZStack {
            LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20){
                Image("Instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                    CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                
            
               
                Button {
                    viewModel.resetPassword(withEmail: email)
                    
                } label: {
                    Text("Reset password")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 16)
                        .background(Color("CircleTabColor"))
                        .cornerRadius(25)
                        .font(.system(size: 20, weight: .semibold))
                    
                }

                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                        
                        Text("Sing In")
                            .font(.system(size: 15, weight: .bold))
                

                }.padding(.bottom)

            }
        }.foregroundColor(.white)
                .padding(.top, -65)
        }
        .navigationBarBackButtonHidden(true)
        .onReceive(viewModel.$didSendResetPasswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}


