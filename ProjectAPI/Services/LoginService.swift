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
import SafariServices
import WebKit

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
    
    func loginWithGoogle(completion: @escaping (String?) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(nil)
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { user, error in
                if let error = error {
                    print("Error connecting with Google: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                
                guard let user = user?.user,
                      let idToken = user.idToken else {
                    completion(nil)
                    return
                }
                
                let accessToken = user.accessToken
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                               accessToken: accessToken.tokenString)
                
                Auth.auth().signIn(with: credential) { res, error in
                    if let error = error {
                        print("Error during Google auth: \(error.localizedDescription)")
                        completion(nil)
                        return
                    }
                    
                    guard let user = res?.user else {
                        completion(nil)
                        return
                    }
                    
                    let userName = user.displayName ?? "null"
                    completion(userName)
                }
            }
        } else {
            completion(nil)
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
        
    }
    
    // MARK: - GitHub Sign-In
    struct GitHubSignInButton: UIViewRepresentable {
        
        func makeUIView(context: Context) -> UIButton {
            let button = UIButton(type: .system)
            
            button.setTitle("Sign in with GitHub", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .gray
            
            return button
        }
        
        func updateUIView(_ uiView: UIButton, context: Context) {}
    }
    
    
    func loginWithGitHub(completion: @escaping (URL?) -> Void) {
        
        let provider = OAuthProvider(providerID: "github.com")
                
        
        let clientID = "0d3bb26953af1e251399"
//        let clientSecret = "d3905c32ed61208234a27eb6dab54bbdd9c3e1e0"
        let redirectURI = "https://projectapi-dti.firebaseapp.com/__/auth/handler"
        let authorizationURL = "https://github.com/login/oauth/authorize"
        
        let urlString = "\(authorizationURL)?client_id=\(clientID)&redirect_uri=\(redirectURI)&scope=user"
        if let url = URL(string: urlString) {
            
//        https://github.com/login/oauth/authorize?client_id=0d3bb26953af1e251399&redirect_uri=https://projectapi-dti.firebaseapp.com/__/auth/handle&scope=user
            
            print("url: \(url)")
            
            completion(url)
            
        }
        
    }
    
    struct WebView: UIViewRepresentable {
        let url: URL
        
        func makeUIView(context: Context) -> WKWebView {
            let webView = WKWebView()
            return webView
        }
        
        func updateUIView(_ uiView: WKWebView, context: Context) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
}
    
//    
//
//    struct GitHubSignInWebView: UIViewControllerRepresentable {
//        typealias UIViewControllerType = UIViewController
//
//        var completion: (String?) -> Void
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            let viewController = UIViewController()
//            let webView = UIWebView(frame: viewController.view.bounds)
//            webView.delegate = context.coordinator
//            viewController.view.addSubview(webView)
//
//            let clientID = "0d3bb26953af1e251399"
//            let clientSecret = "d3905c32ed61208234a27eb6dab54bbdd9c3e1e0"
//            let redirectURI = "https://projectapi-dti.firebaseapp.com/__/auth/handler"
//            let authorizationURL = "https://github.com/login/oauth/authorize"
//
//            let urlString = "\(authorizationURL)?client_id=\(clientID)&redirect_uri=\(redirectURI)&scope=user"
//            if let url = URL(string: urlString) {
//                let request = URLRequest(url: url)
//                webView.loadRequest(request)
//            }
//
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//
//        func makeCoordinator() -> Coordinator {
//            Coordinator(parent: self)
//        }
//
//        class Coordinator: NSObject, UIWebViewDelegate {
//            var parent: GitHubSignInWebView
//
//            init(parent: GitHubSignInWebView) {
//                self.parent = parent
//            }
//
//            func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
//                if let url = request.url, url.absoluteString.hasPrefix("SUA_URL_DE_REDIRECIONAMENTO") {
//                    // Extrair o código do URL
//                    if let code = url.queryParameters?["code"] {
//                        // Trocar o código por um token de acesso
//                        exchangeCodeForToken(code: code)
//                    } else {
//                        parent.completion(nil)
//                    }
//
//                    // Fechar a WebView após obter o código ou lidar com o erro
//                    webView.removeFromSuperview()
//                    parent.completion(nil)
//                    return false
//                }
//                return true
//            }
//
//            func exchangeCodeForToken(code: String) {
//                // Implemente a lógica para trocar o código por um token de acesso aqui
//                // Use a API do GitHub para obter o token de acesso
//                // Envie o token de acesso para o completionHandler
//                parent.completion("SEU_TOKEN_DE_ACESSO")
//            }
//        }
//    }
//
//}
//
//extension URL {
//    var queryParameters: [String: String]? {
//        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
//              let queryItems = components.queryItems else { return nil }
//
//        var parameters = [String: String]()
//        for item in queryItems {
//            parameters[item.name] = item.value
//        }
//        return parameters
//    }
//}
