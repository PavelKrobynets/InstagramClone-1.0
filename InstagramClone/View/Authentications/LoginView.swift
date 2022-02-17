//
//  LoginVIew.swift
//  InstagramClone
//
//  Created by mac on 18.10.2021.
//

import SwiftUI

struct LoginView: View {
    var gradient = Gradient(colors: [Color("CircleTabColor"), Color("FollowColor")])
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(spacing: 20){
                    Image("Instagram")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                    CustomSecureField(pass: $password, placeholder: "Password")
                    
                    HStack{
                        Spacer()
                        
                        NavigationLink {
                            ResetPasswordView(email: email)
                        } label: {
                            Text("Forgot password ?")
                                .padding(.trailing)
                        }


                    }
                   
                    Button {
                        viewModel.login(email: email, password: password)
                    } label: {
                        Text("Sing In")
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 16)
                            .background(Color("CircleTabColor"))
                            .cornerRadius(25)
                            .font(.system(size: 20, weight: .semibold))
                        
                    }

                    Spacer()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarHidden(true)
                    } label: {
                        HStack{
                            Text("Don't have account ?")
                            
                            Text("Sing up")
                                .font(.system(size: 15, weight: .bold))
                    }

                }
            }.foregroundColor(.white)
                    .padding(.top, -65)
            }
    }
}
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            
            
            
            
            
    }
}
