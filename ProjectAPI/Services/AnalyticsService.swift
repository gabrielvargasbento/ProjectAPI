//
//  Analytics.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 23/12/19.
//

import SwiftUI
import Foundation
import FirebaseAnalytics
import FirebaseAuth
import FirebaseCore
import Firebase
import GoogleSignIn
import FirebaseAuth
import AuthenticationServices

class AnalyticsService {
    
    func analytics(userName: String, className: String) {
        Analytics.logEvent(
            AnalyticsEventScreenView,
            parameters: [
                AnalyticsParameterScreenName: userName,
                AnalyticsParameterScreenClass: className,
                AnalyticsParameterOrigin: "Gabriel Vargas"
            ]
        )
    }

    func buttonEvent(buttonName: String) {
        Analytics.logEvent("button_clicked", parameters: ["button_name": buttonName])
    }

}





/*
 Link dos possiveis parametros:
 https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Param
 */
