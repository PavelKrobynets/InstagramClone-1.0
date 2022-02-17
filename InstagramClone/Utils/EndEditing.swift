//
//  EndEditing.swift
//  InstagramClone
//
//  Created by mac on 05.10.2021.
//

import UIKit
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

