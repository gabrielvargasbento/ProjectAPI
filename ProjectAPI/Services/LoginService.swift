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
import Combine

class LoginService {
    
    // MARK: - Logout
    func logout() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
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
        let scopes = ["user"]
        
        provider.scopes = scopes
        
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
                    
                    // Obter link da API para carregar informacoes
                    if let accessToken = oauthCredential.accessToken {
                        
                        let url = URL(string: "https://api.github.com/user")!
                        var request = URLRequest(url: url)
                        request.httpMethod = "GET"
                        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
                        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                        request.addValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")
                        
                        // Fazer a solicitacao
                        URLSession.shared.dataTask(with: request) { data, response, error in
                            guard let data = data, error == nil else {
                                completion(nil)
                                print("Erro ao obter dados do usuário do GitHub: \(String(describing: error?.localizedDescription))")
                                return
                            }
                            
                            do {
                                // Analisar os dados JSON para obter informacoes do usuario
                                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                    if let userName = json["name"] as? String {
                                        completion(userName)
                                    } else {
                                        print("Nome do usuário não encontrado no JSON.")
                                        completion(nil)
                                    }
                                }
                            } catch {
                                print("Erro ao analisar dados JSON: \(error.localizedDescription)")
                                completion(nil)
                            }
                        }.resume()
                    } else {
                        completion(nil)
                    }
                }
            } else {
                completion(nil)
            }
        }
        completion("nil")
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
        
        // Redirect URL: msauth.gabrielvargas.ProjectAPI://auth
        
        let kClientID = "d234ed16-7238-400d-b645-660139f1a3d2"
        let kRedirectUri = "msauth.gabrielvargas.ProjectAPI://auth"
        let kAuthority = "https://login.microsoftonline.com/common"
        let kGraphEndpoint = "https://graph.microsoft.com/"
        
        // Conectar a Microsoft
        let provider = OAuthProvider(providerID: "microsoft.com")
        
        let scopes = ["mail.read", "calendars.read"]
        provider.scopes = scopes
        
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
                    
                    // Obter link da API para carregar informacoes
                    if let accessToken = oauthCredential.accessToken {
                        
                        let url = URL(string: "https://graph.microsoft.com/v1.0/me")!
                        var request = URLRequest(url: url)
                        request.httpMethod = "GET"
                        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
                        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                        
                        // Fazer a solicitacao
                        URLSession.shared.dataTask(with: request) { data, response, error in
                            guard let data = data, error == nil else {
                                completion(nil)
                                print("Erro ao obter dados do usuário da Microsoft: \(String(describing: error?.localizedDescription))")
                                return
                            }
                            
                            do {
                                // Analisar os dados JSON para obter informacoes do usuario
                                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                    if let givenName = json["givenName"] as? String, let surname = json["surname"] as? String {
                                        let userName = "\(givenName) \(surname)"
                                        completion(userName)
                                    } else {
                                        print("Nome do usuário não encontrado no JSON.")
                                        completion(nil)
                                    }
                                }
                            } catch {
                                print("Erro ao analisar dados JSON: \(error.localizedDescription)")
                                completion(nil)
                            }
                        }.resume()
                    } else {
                        completion(nil)
                    }
                }
            } else {
                completion(nil)
            }
        }
        completion("nil")
    }
}



