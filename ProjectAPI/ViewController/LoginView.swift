//
//  LoginView.swift
//  ProjectAPI
//
//  Created by Gabriel Vargas on 08/01/24.
//

import SwiftUI
import GoogleSignIn
import FirebaseCore
import FirebaseAuth
import AuthenticationServices

struct LoginView: View {
    
    private let loginService = LoginService()
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
        VStack(spacing: 40) {
            if userIsLoggedIn {
                Text("You are logged in")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                Button(action: {
                    // Perform logout action here
                    loginService.logout()
                    userIsLoggedIn.toggle()
                }) {
                    Text("Logout")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.red)
                        )
                }
            } else {
                Text("Login")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                
                Button {
                    loginService.register(email: email, password: password)
                } label: {
                    Text("Sign up")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.green)
                        )
                }
                
                Button {
                    loginService.login(email: email, password: password)
                } label: {
                    Text("Login")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.green)
                        )
                }
                
                LoginService.GoogleSignInButton()
                .frame(width: 200, height: 40)
                .onTapGesture {
                    loginService.loginWithGoogle()
                }
                
                LoginService.AppleSignInButton { authorization, error in
                    if let error = error {
                        print("Error during Apple login: \(error.localizedDescription)")
                    } else if let appleIDCredential = authorization?.credential as? ASAuthorizationAppleIDCredential {
                        let userIdentifier = appleIDCredential.user

                        loginService.loginWithApple(credential: appleIDCredential) { result in
                            switch result {
                            case .success:
                                print("Apple login successful: \(userIdentifier)")
                            case .failure(let error):
                                print("Error duribg Apple login: \(error.localizedDescription)")
                            }
                        }
                    }
                }
                .frame(width: 200, height: 40)

                LoginService.GitHubSignInButton { token, error in
                    if let error = error {
                        print("Erro durante o login do GitHub: \(error.localizedDescription)")
                    } else if let token = token {
                        print("Login do GitHub bem-sucedido. Token: \(token)")
                    }
                }
                .frame(width: 200, height: 40)
            }
        }
        .frame(width: 350)
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    userIsLoggedIn.toggle()
                }
            }
        }
    }
}
