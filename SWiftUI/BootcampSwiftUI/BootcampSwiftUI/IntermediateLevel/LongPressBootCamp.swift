//
//  LongPressBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 16/04/2023.
//

import SwiftUI

struct LongPressBootCamp: View {
    
    @State var isCompleted = false
    
    var body: some View {
        Text(isCompleted ? "Completed Task" : "Not Completed Task yet")
            .padding()
            .background(isCompleted ? .green : .gray)
            .cornerRadius(10)
            .onLongPressGesture(minimumDuration: 2, maximumDistance: 100) {
                isCompleted.toggle()
            }
    }
}


struct LoadingViewBootCamp: View {
    
    @State var isCompleted = false
    @State var isSuccess = false
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ?.green : .blue)
                .frame(maxWidth: isCompleted ? .infinity : 10)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("Loading")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 100) { isPressing in
                        if isPressing {
                            withAnimation(.linear(duration: 1.0)) {
                                isCompleted.toggle()
                            }
                        } else {
                            if !isCompleted {
                                withAnimation(.easeInOut) {
                                    isCompleted = false
                                }
                                
                            }
                        }
                        
                    } perform: {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                
                Text("Rest")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .onTapGesture {
                        isSuccess = false
                        isCompleted = false
                    }
            }
        }
        
    }
}

struct LongPressBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewBootCamp()
    }
}
