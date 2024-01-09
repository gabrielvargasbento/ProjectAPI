//
//  AppDelegate.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas em 21/12/23.
//

import Foundation
import FirebaseCore
import FirebaseAnalytics
import FirebaseAuth
import GoogleSignIn
import FirebaseMessaging
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {

    var app: MainView?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        print("Configurando o Firebase...")

        application.registerForRemoteNotifications()
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self

        print("Configuração do Firebase concluída.")

        return true
    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        
        if let deepLink: String = response.notification.request.content.userInfo["link"] as? String,
           let url = URL(string: deepLink) {
            print("deepLink received: \(deepLink)")
            
            Task {
                await app?.handleDeepLink(from: url)
            }
        }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.sound, .badge, .banner, .list]
    }
    
}

extension AppDelegate: MessagingDelegate {
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func messaging(_ messaging: Messaging, 
                   didReceiveRegistrationToken fcmToken: String?) {
        
        #if DEBUG
        print("!!! FCM Token: \(String(describing: fcmToken))")
        #endif
    }
}


