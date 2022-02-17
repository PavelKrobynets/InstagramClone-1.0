//
//  CustomSecureField.swift
//  InstagramClone
//
//  Created by mac on 18.10.2021.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var pass : String
    let placeholder : String
    var body: some View {
        Label {
            SecureField(placeholder , text: $pass)
                .foregroundColor(Color(.init(white: 1 , alpha: 0.8)))
        } icon: {
            Image(systemName: "lock")
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

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(pass: .constant(""), placeholder: "password")
    }
}
