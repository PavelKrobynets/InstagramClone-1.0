//
//  RegistrationView.swift
//  InstagramClone
//
//  Created by mac on 18.10.2021.
//

import SwiftUI

struct RegistrationView: View {
    @Environment (\.presentationMode) var mode
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @State private var selectedImage : UIImage?
    @State private  var profileImage : Image?
    @State private var imagePickerPresented = false
    
    var gradient = Gradient(colors: [Color("CircleTabColor"), Color("FollowColor")])
    
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        ZStack{
            LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 15){
                if profileImage == nil {
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        VStack{
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 140,weight: .ultraLight))
                                .foregroundColor(.white)
                            
                        Text("Add Photo")
                                .font(.system(size: 30, weight: .semibold ))
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 10)
                        }
                    }
                        .sheet(isPresented: $imagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                }
                else if let image = profileImage {
                     image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width / 1.8, height: UIScreen.main.bounds.height / 5)
                        .clipShape(Circle())
                }
                 CustomTextField(text: $email, placeholder: "Email", imageName: "envelope")
                CustomTextField(text: $username, placeholder: "User name", imageName: "person")
                CustomTextField(text: $fullname, placeholder: "Full name", imageName: "person")
                CustomSecureField(pass: $password, placeholder: "Password")
                
                Button {
                    viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                } label: {
                    Text("Sing Up")
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
                }

                }.padding(.bottom)
            }.foregroundColor(.white)
        }
    }
}
    
extension RegistrationView  {
        func loadImage() {
            guard let selectedImage = selectedImage else { return }
            profileImage = Image(uiImage: selectedImage)
            
        }
    }

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
       RegistrationView()
    }
}


