//
//  AnalyticsService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 23/12/19.
//

import Firebase
import CwlCatchException

protocol FirebaseAnalytics {
    func logEvent(_ name: String, parameters: [String: Any]?)
}

class FirebaseAnalyticsImpl: FirebaseAnalytics {
    func logEvent(_ name: String, parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}

class AnalyticsService {
    private let firebaseAnalytics: FirebaseAnalytics

    init(firebaseAnalytics: FirebaseAnalytics = FirebaseAnalyticsImpl()) {
        self.firebaseAnalytics = firebaseAnalytics
    }

    func analytics(userName: String, className: String) {
        firebaseAnalytics.logEvent(
            AnalyticsEventScreenView,
            parameters: [
                AnalyticsParameterScreenName: userName,
                AnalyticsParameterScreenClass: className,
                AnalyticsParameterOrigin: "Gabriel Vargas"
            ]
        )
    }

    func buttonEvent(buttonName: String) {
        firebaseAnalytics.logEvent("button_clicked", parameters: ["button_name": buttonName])
    }
}
