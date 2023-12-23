//
//  AppDelegate.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 21/12/23.
//

import Foundation
import FirebaseCore
import UserNotifications
import FirebaseMessaging
import FirebaseAnalytics

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    func application(_ application: UIApplication, 
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:],
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Determine who sent the URL.
        let sendingAppID = options[.sourceApplication]
        print("source application = \(sendingAppID ?? "Unknown")")
        
        // Process the URL.
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
            let listPath = components.path,
            let params = components.queryItems else {
                print("Invalid URL")
                return false
        }

        print("Configurando Firebase...")

        // 1. Solicitar permissões de notificação
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
            if let error = error {
                print("Erro ao solicitar autorização para notificações: \(error.localizedDescription)")
            }
        }

        // 2. Registrar para notificações remotas
        application.registerForRemoteNotifications()

        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self

        Messaging.messaging().delegate = self

        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
               //self.fcmRegTokenMessage = "Remote FCM registration token: \(token)"
            }
        }
    
        Messaging.messaging().isAutoInitEnabled = true

        print("Configuração do Firebase concluída.")
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 3. Configurar o token APNS
        Messaging.messaging().apnsToken = deviceToken
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")

        let dataDict: [String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
    }
    
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {


        // Determine who sent the URL.
        if let urlContext = connectionOptions.urlContexts.first {


            let sendingAppID = urlContext.options.sourceApplication
            let url = urlContext.url
            print("source application = \(sendingAppID ?? "Unknown")")
            print("url = \(url)")


            // Process the URL similarly to the UIApplicationDelegate example.
        }


        /*
         *
         */
    }
}
