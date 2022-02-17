//
//  NotificationsView.swift
//  InstagramClone
//
//  Created by mac on 30.09.2021.
//

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 20){
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
