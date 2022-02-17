//
//  Timestamp.swift
//  InstagramClone
//
//  Created by mac on 19.11.2021.
//

import SwiftUI
import Firebase

extension  View{
    func timestampString(timestamp: Timestamp) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
}
