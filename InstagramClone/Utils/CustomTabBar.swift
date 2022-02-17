//
//  CustomTabs.swift
//  InstagramClone
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

enum Tabs : String , CaseIterable{
    case Feed = "house"
    case Search = "magnifyingglass"
    case Upload = "plus.diamond"
    case Notifications = "heart"
    case Profile = "person"
    
    var tabName: String {
        switch self {
        case .Feed : return "Home"
        case .Search: return "Search"
        case .Upload: return "New Post"
        case .Notifications: return "Notifications"
        case .Profile: return "Profile"
        }
    }
}

struct CustomTabBar: View {
    var animation: Namespace.ID
    @Binding var currentTab: Tabs
    var body: some View {
        HStack(spacing: 20){
            ForEach(Tabs.allCases, id: \.rawValue){tab in
                TabButton(tab: tab, animation: animation, currentTab: $currentTab) { pressedTab in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                        currentTab = pressedTab
                    }
                }
            }
        }
        
    }
}


struct TabButton: View {
    var tab: Tabs
    var animation: Namespace.ID
    @Binding var currentTab: Tabs
    var onTap: (Tabs)->()
    
    var body: some View{
        Image(systemName: tab.rawValue)
            .foregroundColor(currentTab == tab ? .white : .gray)
            .frame(width: 45, height: 45)
            .background(
                ZStack{
                    if currentTab == tab{
                        Circle()
                            .fill(Color("CircleTabColor"))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                }
            ).frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                onTap(tab)
            }
    }
}

struct CustomTabs_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
