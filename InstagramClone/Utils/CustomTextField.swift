//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by mac on 18.10.2021.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text : String
    let placeholder : String
    let imageName : String
    var body: some View {
        Label {
            TextField(placeholder , text: $text)
                .foregroundColor(Color(.init(white: 1 , alpha: 0.8)))
        } icon: {
            Image(systemName: imageName)
                .shadow(color: .white, radius: 5)
        }.padding()
            .background(Color("TextField"))
            .cornerRadius(8)
            .padding(.horizontal, 25)
            .opacity(0.6)
            .foregroundColor(.white)
            .font(.system(size: 23, weight: .semibold))
            
           
            
            


    }
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "mail", imageName: "envelope")
            .preferredColorScheme(.dark)
    }
}
