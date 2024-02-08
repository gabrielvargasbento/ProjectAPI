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
//import Nimble_Snapshots

struct LoginView: View {
    
    private let loginService = LoginService()
    
    @State private var email = ""
    @State private var password = ""
    @State private var userNameLogged = ""
    @State private var userIsLoggedIn = false
    
    @State private var showAlert = false
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack(spacing: 40) {
            if userIsLoggedIn {
                Text("You are logged in, \(userNameLogged)")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                Button(action: {
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
                Text("Login Page")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                TextField("Email", text: $email)
                    .accessibilityIdentifier("EmailField")
                SecureField("Password", text: $password)
                    .accessibilityIdentifier("PasswordField")
                
                Button {
                    loginService.register(email: email, password: password) { result, error in }
                } label: {
                    Text("Register")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.green)
                        )
                }
                
                Button {
                    loginService.login(email: email, password: password) { result, error in }
                    userNameLogged = String(email.prefix { $0 != "@" })
                    print("userNameLogged = \(userNameLogged)")
                    
                } label: {
                    Text("Sign In")
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
                        loginService.loginWithGoogle { userName, error in
                            if let userName = userName {
                                userNameLogged = userName
                                print("Nome do usuário:", userName)
                            }
                        }
                    }
                
                LoginService.AppleSignInButton()
                    .frame(width: 200, height: 40)
                    .onTapGesture {
                        loginService.loginWithApple { userName in
                            if let userName = userName {
                                userNameLogged = userName
                                print("Nome do usuário:", userName)
                            }
                        }
                    }
                
                LoginService.GitHubSignInButton()
                    .frame(width: 200, height: 40)
                    .onTapGesture {
                        loginService.loginWithGitHub { userName, error in
                            if let userName = userName {
                                userNameLogged = userName
                                print("Nome do usuário:", userName)
                            }
                        }
                    }
                
                LoginService.MicrosoftInButton()
                    .frame(width: 200, height: 40)
                    .onTapGesture {
                        loginService.loginWithMicrosoft { userName, error in
                            if let userName = userName {
                                userNameLogged = userName
                                print("Nome do usuário:", userName)
                            }
                        }
                    }
            }
        }
        .frame(width: 350)
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    userIsLoggedIn = true
                    showAlert = true
                    print("user: \(String(describing: user))")
                } else {
                    userIsLoggedIn = false
                    showAlert = false
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Sucesso!"),
                message: Text("Você está logado!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
