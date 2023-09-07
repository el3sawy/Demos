//
//  ButtonView.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 05/04/2022.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack(spacing: 15) {
            DefaultButton()
            ButtonColor()
            ButtonForgetPassword()
            ButtonRegister()
            SolidButton()
            RoundButton()
            ButtonSquare()
            ButtonRec()
            ButtonWithImage()
        }
        
    }
}

struct ButtonWithImage: View {
    var body: some View {
        Button(action: { print("ButtonWithImage Tapped")}) {
            Text("ButtonSquare")
                .padding()
            Image(systemName: "gift.fill")
        }
        .padding(.trailing)
        .foregroundColor(Color.white)
        .background(Color.purple)
        .cornerRadius(10)
    }
}

struct ButtonRec: View {
    var body: some View {
        Button(action: { print("ButtonSquare Tapped")}) {
            Text("ButtonSquare")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.purple, lineWidth: 5)
                )
        }
    }
}
struct ButtonSquare: View {
    var body: some View {
        Button(action: { print("ButtonSquare Tapped")}) {
            Text("ButtonSquare")
                .padding()
                .border(Color.red)
        }
    }
}
struct RoundButton: View {
    var body: some View {
        Button(action: {print("SolidButton Tapped")}) {
            Text("Solid Button")
                .padding(EdgeInsets(top: 12, leading: 20, bottom: 20, trailing: 12))
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(.infinity)
        }
    }
}
struct SolidButton: View {
    var body: some View {
        Button(action: {print("SolidButton Tapped")}) {
            Text("Solid Button")
                .padding()
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(8)
        }
        .shadow(color: Color.purple, radius: 20, x: 5, y: 5)
    }
}

struct ButtonRegister: View {
    var body: some View {
        Button(action: { print("ButtonRegister Tapped")}) {
            VStack {
                Text("New user ")
                Text("Register?")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
            }
        }
    }
}
struct ButtonForgetPassword: View {
    var body: some View {
        Button(action: { print("ButtonForgetPassword Tapped")}) {
            Text("Forget password")
            Text("Tapp here to recovery?")
                .foregroundColor(.red)
                .fontWeight(.bold)
        }
    }
}

struct ButtonColor: View {
    var body: some View {
        Button(action: { print("Button text color Tapped")}) {
            Text("Button text color")
                .foregroundColor(.red)
                .fontWeight(.bold)
        }
    }
}

struct DefaultButton: View {
    var body: some View {
        Button("Default Button Style") {
            print("Default Button Style Tapped")
        }
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
