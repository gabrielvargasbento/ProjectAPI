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
    @State private var userNameLogged = ""
    @State private var userIsLoggedIn = false
    
    @State private var showAlert = false
    
    @State private var isSheetPresented = false
    @State private var urlWeb: URL?
    
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
                    userNameLogged = String(email.prefix { $0 != "@" })
                    print("userNameLogged = \(userNameLogged)")
                    
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
                        loginService.loginWithGoogle { userName in
                            if let userName = userName {
                                userNameLogged = userName
                                print("Nome do usuário:", userName)
                            }
                        }
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

                LoginService.GitHubSignInButton()
                    .frame(width: 200, height: 40)
                    .onTapGesture {
                        loginService.loginWithGitHub { url in
                            if let url = url {
                                urlWeb = url
                                print("urlWeb = \(String(describing: urlWeb))")
                                isSheetPresented = true
                            }
                        }
                    }
                    .sheet(isPresented: $isSheetPresented, content: {
                        LoginService.WebView(url: (urlWeb ?? URL(string: "https://github.com/login/oauth/authorize?client_id=0d3bb26953af1e251399&redirect_uri=https://projectapi-dti.firebaseapp.com/__/auth/handler"))!)
                                                                 
                                                                 
                                                                 
                                                                 //=projectapi://repositoryMenu"))!)
                    })
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
