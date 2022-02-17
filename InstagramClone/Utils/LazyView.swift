//
//  LazyView.swift
//  InstagramClone
//
//  Created by mac on 21.11.2021.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content){
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
