//
//  LoginService.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 08/01/24.
//

import SwiftUI
import AuthenticationServices
import Firebase
import FirebaseAuth
import GoogleSignIn
import UIKit
import FirebaseCore

class LoginService {

    // MARK: - Logout
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error during logout: \(error.localizedDescription)")
        }
    }
    
    // MARK: - E-mail Sign-In
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error during login: \(error.localizedDescription)")
            }
        }
    }

    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error during register: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Google Sign-In
    struct GoogleSignInButton: UIViewRepresentable {
        
        func makeUIView(context: Context) -> GIDSignInButton {
            let button = GIDSignInButton()
            button.style = .wide
            return button
        }

        func updateUIView(_ uiView: GIDSignInButton, context: Context) {}

        static func handle(_ url: URL) -> Bool {
            return GIDSignIn.sharedInstance.handle(url)
        }
    }
    
    func loginWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { user, error in
                if let error = error {
                    print("Error signIn Google: \(error.localizedDescription)")
                    return
                }
                
                guard
                    let user = user?.user,
                    let idToken = user.idToken else { return }
                
                let accessToken = user.accessToken
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                               accessToken: accessToken.tokenString)
                
                Auth.auth().signIn(with: credential) { res, error in
                    if let error = error {
                        print("Error auth with Google: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = res?.user else { return }
                    print(user)
                }
            }
        } else {
            print("Não foi possível obter o rootViewController.")
        }
    }

    // MARK: - Apple Sign-In
    struct AppleSignInButton: UIViewRepresentable {
        var completion: (ASAuthorization?, Error?) -> Void

        func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
            return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
        }

        func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
    }
    
    func loginWithApple(credential: ASAuthorizationAppleIDCredential, completion: @escaping (Result<Void, Error>) -> Void) {
        let token = credential.identityToken
        guard let tokenData = token else {
            completion(.failure(NSError(domain: "com.yourapp.error", code: 500, userInfo: [NSLocalizedDescriptionKey: "Unable to retrieve Apple ID token"])))
            return
        }

        let tokenString = String(data: tokenData, encoding: .utf8)

        let appleCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString!, rawNonce: nil)

        Auth.auth().signIn(with: appleCredential) { (authResult, error) in
            if let error = error {
                print("Error during Apple login: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            completion(.success(()))
        }
    }

    // MARK: - GitHub Sign-In
    struct GitHubSignInButton: UIViewRepresentable {
        var completion: (String?, Error?) -> Void

        func makeUIView(context: Context) -> UIButton {
            let button = UIButton(type: .system)
            
            button.setTitle("Sign in with GitHub", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .gray
            
            return button
        }

        func updateUIView(_ uiView: UIButton, context: Context) {}
    }
}
