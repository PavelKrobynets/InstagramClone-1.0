//
//  CustomInputView.swift
//  InstagramClone
//
//  Created by mac on 10.11.2021.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText : String
    var placeholder: String
    var action: () -> Void
    var body: some View {
        VStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .foregroundColor(Color(.separator))
                .padding(.bottom, 5)
            
            HStack{
                TextField(placeholder, text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Spacer()
                
                Button {
                    action()
                    
                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.blue)
                }

                
                
            }.padding(.horizontal)
        }.padding(.bottom)
    }
}

