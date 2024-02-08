//
//  NotificationService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 22/12/23.
//

import Foundation
import UserNotifications
import CwlCatchException

//@MainActor
class NotificationService: ObservableObject {
    
    @Published var hasPermission = false
    
    init() {
        Task {
            await self.getAuthStatus()
        }
    }
    
    func resetStatus() {
        hasPermission = false
    }
    
    func request() async {
        do {
            self.hasPermission = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
        } catch {
            print (error)
        }
    }
    
    func getAuthStatus() async {
        let status = await UNUserNotificationCenter.current().notificationSettings()
        switch status.authorizationStatus {
        case .authorized, .provisional, .ephemeral:
            hasPermission = true
        default:
            hasPermission = false
        }
    }
}
