//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage : UIImage?
    @State var postImage : Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var selectedTab : Tabs
    var body: some View {
        VStack{
        if postImage == nil {
            Button {
                imagePickerPresented.toggle()
            } label: {
                VStack{
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 240,weight: .ultraLight))
                    .foregroundColor(Color("TextColor"))
                    
                Text("Add Photo")
                        .font(.system(size: 50, weight: .semibold ))
                        .foregroundColor(Color("TextColor"))
                        .shadow(color: .gray, radius: 10)
                }
            }.offset(y: UIScreen.main.bounds.height / -6)
                .sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }

        } else if let image = postImage{
            HStack(alignment: .top){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                        .padding([.top, .leading], 3)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("TextColor"))
                        .opacity(0.2)
                        .background(
                            Color.white
                                .opacity(0.08)
                                .blur(radius: 5)
                        )
                     TextEditor(text: $captionText)
                    .cornerRadius(8)
                    .opacity(0.6)
                    .foregroundColor(Color("TextColor"))
                   
                    .lineLimit(4)
                    .padding(.trailing, 0)
                   
                } .frame(height: UIScreen.main.bounds.height / 8)
                    .padding(.trailing)
            }
                
 
            HStack {
                
                Button {
                    captionText = ""
                    postImage = nil
                    selectedTab = .Upload
                } label: {
                    Text("back")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 19)
                        .background(Color("CancelColor"))
                        .cornerRadius(5)
                        .shadow(radius: 5)
                        .padding(.leading)
                        .padding(.leading)
                }
                
                Button {
                    if let image = selectedImage{
                        viewModel.uploadPost(caption: captionText, image: image) { _ in
                            captionText = ""
                            postImage = nil
                            selectedTab = .Feed
                        }
                    }
                } label: {
                    Text("Share")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 19)
                        .background(Color("FollowColor"))
                        .cornerRadius(5)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    
                }.padding()
               
            }.padding(.horizontal)
                


                Spacer()
            }
            
        }
    }
}

extension UploadPostView  {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
        
    }
}


