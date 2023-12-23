//
//  NotificationView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 22/12/23.
//

import SwiftUI

struct NotificationView: View {
    
    @StateObject private var notification = NotificationService()
    
    var body: some View {
        Button("Permissão de notificação") {
            Task {
                await notification.request()
            }
        }
        .buttonStyle(.bordered)
        .disabled(notification.hasPermission)
        .task {
            await notification.getAuthStatus()
        }
    }
}
