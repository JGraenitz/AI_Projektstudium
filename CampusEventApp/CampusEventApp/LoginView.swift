//
//  ContentView.swift
//  TestApp
//
//  Created on 14.05.24.
//

import SwiftUI
import Firebase
import FirebaseCore

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSignedIn  = false
    
    init() {
        FirebaseApp.configure()
    }
    

    var body: some View {
        ZStack {
            Image("hintergrund")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
        
            VStack {
                Image("Logo_HTW_Berlin.svg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200)
                    .padding()
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                
                VStack{
                    HStack {
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                    }
        
                    
                    TextField("Email/Matrikelnummer", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(20)
                        .frame(width: 300, height: 40)
                        .shadow(radius: 5, x:0, y:5)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(20)
                        .frame(width: 300, height: 40)
                        .shadow(radius: 5, x:0, y:5)
                    Button(action: {
                        loginUser()
                    }){
                        Text("Login")
                            .frame(width: 300, height: 40)
                            .foregroundColor(.black)
                            .background(Color.green)
                            .cornerRadius(20)
                            .shadow(radius: 5, x:0 , y:5)
                    }
                    .padding()
                    
                    Spacer()
                }
                .background(
                    VStack {
                        Spacer(minLength: 30)
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.gray.opacity(0.2))
                            .padding()
                        Spacer(minLength: 40)
                    }
                )
                .padding()
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(
                Image("hintergrund")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
                
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, err in
            if let err = err {
                print("Failed to log in", err)
                return
            }
            print("Sucessful logged in as user: \(result?.user.uid ?? "")")
            isSignedIn = true
        }
    }
    
}



    
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
