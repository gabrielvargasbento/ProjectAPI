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
        
        func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
            return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
        }
        
        func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
    }
    
    func loginWithApple(credential: ASAuthorizationAppleIDCredential, completion: @escaping (Result<Void, Error>) -> Void) {
        
    }
    
    func loginWithApple(completion: @escaping (String?) -> Void) {
        completion("")
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
    
    
    func loginWithGitHub(completion: @escaping (String?) -> Void) {
        
        // Conectar ao GitHub
        let provider = OAuthProvider(providerID: "github.com")
        provider.scopes = ["user:email"]
        
        provider.getCredentialWith(nil) { credential, error in
            if let error = error {
                print("Erro ao obter credencial: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let credential = credential {
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        print("Erro ao fazer login: \(error.localizedDescription)")
                        completion(nil)
                        return
                    }
                    
                    guard let oauthCredential = authResult?.credential as? OAuthCredential else {
                        print("Erro ao obter informações do perfil: \(String(describing: error?.localizedDescription))")
                        completion(nil)
                        return
                    }
                }
            }

        }
        let null = "null"
        completion(null)
    }
    
    // MARK: - Microsoft Sign-In
    struct MicrosoftInButton: UIViewRepresentable {
        
        func makeUIView(context: Context) -> UIButton {
            let button = UIButton(type: .system)
            
            button.setTitle("Sign in with Microsoft", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .orange
            
            return button
        }
        
        func updateUIView(_ uiView: UIButton, context: Context) {}
    }
    
    
    func loginWithMicrosoft(completion: @escaping (String?) -> Void) {
        
        // Conectar ao GitHub
        let provider = OAuthProvider(providerID: "microsoft.com")
        provider.scopes = ["mail.read", "calendars.read"]
        
        provider.getCredentialWith(nil) { credential, error in
            if let error = error {
                print("Erro ao obter credencial: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let credential = credential {
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        print("Erro ao fazer login: \(error.localizedDescription)")
                        completion(nil)
                        return
                    }
                    
                    guard let oauthCredential = authResult?.credential as? OAuthCredential else {
                        print("Erro ao obter informações do perfil: \(String(describing: error?.localizedDescription))")
                        completion(nil)
                        return
                    }
                }
            }

        }
        let null = "null"
        completion(null)
    }
}






//                    // Obter link da API para carregar informacoes
//                    let accessToken = oauthCredential.accessToken
//                    let url = URL(string: "https://api.github.com/user")!
//                    var request = URLRequest(url: url)
//                    request.addValue("token \(String(describing: accessToken))", forHTTPHeaderField: "Authorization")


//                    // Faca a solicitacao
//                    URLSession.shared.dataTask(with: request) { data, response, error in
//                        guard let data = data, error == nil else {
//                            completion(nil)
//                            print("Erro ao obter dados do usuário do GitHub: \(String(describing: error?.localizedDescription))")
//                            return
//                        }
//
//                        do {
//                            // Analise os dados JSON para obter informações do usuário
//                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                                print("json: \(json)")
//                                if let userName = json["name"] as? String {
//                                    print("Nome do usuário: \(userName)")
//                                    completion(userName)
//                                } else {
//                                    print("Nome do usuário não encontrado no JSON.")
//                                    completion(nil)
//                                }
//                            }
//                        } catch {
//                            print("Erro ao analisar dados JSON: \(error.localizedDescription)")
//                            completion(nil)
//                        }
//                    }.resume()
