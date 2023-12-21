//
//  FirebaseService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 19/12/23.
//

import Foundation
import FirebaseAnalytics

class FirebaseService {
    
    func analytics (userName: String, className: String) {
        
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: userName,
                                       AnalyticsParameterScreenClass: className,
                                            AnalyticsParameterOrigin: "Gabriel Vargas"])
    }
    
    func buttonEvent(buttonName: String) {
        Analytics.logEvent("button_clicked", 
                           parameters: ["button_name": buttonName])
    }
}
/*
 Link dos possiveis parametros:
 https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Param
 */
