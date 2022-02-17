//
//  TextArea.swift
//  InstagramClone
//
//  Created by mac on 04.11.2021.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String){
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
        var body: some View {
            ZStack(alignment: .leading){
                if text.isEmpty{
                    Text(placeholder)
                        .foregroundColor(Color(UIColor.placeholderText))
                        .frame(height: UIScreen.main.bounds.height / 8)
                     .lineLimit(4)
                     .padding(.horizontal, 8)
                     .padding(.vertical, 12)
                }
            }
    }
}


