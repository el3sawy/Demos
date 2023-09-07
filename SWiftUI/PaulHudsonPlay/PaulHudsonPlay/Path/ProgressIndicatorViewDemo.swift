//
//  ProgressIndicatorViewDemo.swift
//  PaulHudsonPlay
//
//  Created by NTG on 22/07/2023.
//

import SwiftUI

struct ProgressIndicatorViewDemo: View {
    private var purpleGradient = LinearGradient(
        gradient: Gradient(
            colors: [Color (red: 207/255, green: 150/255, blue: 207/255),
                     Color(red: 107/255, green: 116/255,blue: 179/255) ]),
        startPoint: .trailing,
        endPoint: .leading)
    
    
    @State private var isLoading = false
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.85)
                    .stroke(purpleGradient, lineWidth: 20)
                    .frame(width: 300, height: 300)
                    .overlay(
                        VStack {
                            Text("85%")
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                                .foregroundColor(Color(.systemGray))
                            
                            Text("Complete")
                                .font(.system(.body, design: .rounded))
                                .bold()
                                .foregroundColor(Color(.systemGray))
                        }
                    )
            }
            
            Spacer()
            ProgressIndicatorView()
            CircleLoading()
            RectDemo()
            Spacer()
            ZStack {
                Text("Loading")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: -25)
                
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(.systemGray5), lineWidth: 3)
                    .frame(width: 250, height: 3)
                
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.green, lineWidth: 3)
                    .frame(width: 30, height: 3)
                    .offset(x: isLoading ? 110 : -110, y: 0)
                
            }
        }
        .onAppear() {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.isLoading = true
            }
            
        }
    }
}

struct ProgressIndicatorViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicatorViewDemo()
    }
}


private struct ProgressIndicatorView: View {
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        
        ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.body))
                .bold()
            
            Circle()
                .stroke(Color(.systemGray3), lineWidth: 10)
                .frame(width: 150, height: 150)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, lineWidth: 10)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                withAnimation {
                    self.progress += 0.05
                }
                
                print(self.progress)
                if self.progress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
    
}

private struct CircleLoading: View {
    @State private var isLoading = false
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Circle()
                    .fill(.green)
                    .frame(width: 10, height: 10)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .animation(
                        .linear(duration: 0.8)
                        .repeatForever()
                        .delay(0.2 * Double(index)),
                        value: isLoading)
                
            }
        }
        .onAppear {
            isLoading.toggle()
        }
    }
}

private struct RectDemo: View {
    @State private var recordBegin = false
    @State private var recording = false
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 10)
                .fill(recordBegin ? .red : .green)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .overlay {
                    Image(systemName: "mic.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .scaleEffect(recording ? 1: 0.8)
                }
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0.0001: 1)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                recordBegin.toggle()
            }
            
            withAnimation(.spring().repeatForever().delay(0.5)) {
                recording.toggle()
            }
        }
    }
    
}
