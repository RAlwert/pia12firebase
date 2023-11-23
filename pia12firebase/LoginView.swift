//
//  LoginView.swift
//  pia12firebase
//
//  Created by Robin Alwert on 2023-11-23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var loginemail = ""
    @State var loginpass = ""

    var body: some View {
        VStack{
            TextField("Email",text: $loginemail)
            TextField("password",text: $loginpass)
            Button(action: {
                login()
            }, label: {
                Text("login")
            })
            Button(action: {
                register()
            }, label: {
                Text("registrer")
            })
            
            Button(action: {
                
            }, label: {
                Text("reset password ")
            })

        }
    }
    func login() {
        Auth.auth().signIn(withEmail: loginemail, password: loginpass) {
          authResult, error in
            
            if error == nil {
                print (" login ok")
            }else{
                print ("login fail")
            }
        }
      }
      func register() {
        Auth.auth().createUser(withEmail: loginemail, password: loginpass) {
          authResult, error in
            
            if error == nil {
                print (" register ok")
            }else{
                print ("register fail")
            }
        }
      }
}

#Preview {
    LoginView()
}
