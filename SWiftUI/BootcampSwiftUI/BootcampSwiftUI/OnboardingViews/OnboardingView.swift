//
//  OnboardingView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 11/04/2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var onboardingState = 0
    @State var userName = ""
    @State var userAge: Double = 20
    @State var userGender = ""
    @State var alertTitle = ""
    @State var showAlert = false
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // App Storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("logged_in") var userIsLoggedIn = false
    
    var body: some View {
        ZStack {
            Color.purple
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                }
            }
            
            VStack {
                Spacer()
                signInButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

// MARK: - Components
extension OnboardingView {
    private var signInButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" :
                onboardingState == 3 ? "FINISH" :
                "NEXT"
        )
        .foregroundColor(Color.purple)
        .font(.headline)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .onTapGesture {
            handleNextButtonPressed()
        }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(Color.white)
            
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .foregroundColor(Color.white)
                        .offset(y: 5)
                    , alignment: .bottom
                )
            
            Text("This is the first app by swiftui i glad to study this videos. this app for onboarding and AppStorage modules.")
                .foregroundColor(Color.white)
                .fontWeight(.medium)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(15)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your name? ")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
            
            TextField("Your name ...", text: $userName)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(40)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your Age? ")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
            
            Text("\(String(format: "%.0f", userAge))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
            Slider(value: $userAge, in: 18...50, step: 1)
                .tint(Color.white)
            
            Spacer()
            Spacer()
        }
        .padding(40)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("What is your Gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
            
            Menu {
                Picker(selection: $userGender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                } label: {
                    Text("")
                }
                
            } label: {
                Text(userGender.count > 1 ? userGender : "Gender")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.purple)
                    .background(Color.white.cornerRadius(10))
            }
            
            Spacer()
            Spacer()
            
            
        }
        .padding(30)
        
    }
}



extension OnboardingView {
    func handleNextButtonPressed() {
        
        switch onboardingState {
        case 1:
            guard userName.count > 3 else {
                showAlert(title: "Must enter your name")
                return
            }
        case 3:
            guard userGender.count > 3 else {
                showAlert(title: "Must enter your gender")
                return
            }
        default:
            break
        }
        
        if onboardingState == 3 {
            signIn()
            // Sign in
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
    func signIn() {
        currentUserAge = Int(userAge)
        currentUserName = userName
        currentUserGender = userGender
        withAnimation(.spring()) {
            userIsLoggedIn = true
        }
    }
}
