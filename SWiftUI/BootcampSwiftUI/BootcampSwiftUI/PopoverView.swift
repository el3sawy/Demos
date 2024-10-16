//
//  PopoverView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 08/04/2023.
//

import SwiftUI

struct PopoverView: View {
    
    @State var isPresenter = false
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea(.all)
            
            VStack {
                Button("Tapped Me") {
                    
                    isPresenter.toggle()
                    
                    
                }
                .font(.largeTitle)
                
                Spacer()
            }
            
            // method one ==> Sheet
//                    .sheet(isPresented: $isPresenter) {
//                        PopoverSecondViewView(showScreen: $isPresenter)
//                    }
            
            // method Two ==> Transition
            
            ZStack {
                if isPresenter {
                    PopoverSecondViewView(showScreen: $isPresenter)
                        .padding(.top, 40)
                        .transition(.move(edge: .bottom))
                }
            }
//            .zIndex(2.0)
            
            
            // Method Three Animation offset
//            PopoverSecondViewView(showScreen: $isPresenter)
//                .padding(.top, 300)
//                .offset(y: isPresenter ? 0 : UIScreen.main.bounds.height)
            
            
        }
        .animation(.spring(), value: isPresenter) //method one ==> Transition
    }
}


struct PopoverSecondViewView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var showScreen: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .ignoresSafeArea(.all)
            
            VStack {
                Button {
                    showScreen.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                }
                
                
                Spacer()
            }
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.width < 0 {
                                    // left
                                }

                                if value.translation.width > 0 {
                                    // right
                                }
                                if value.translation.height < 0 {
                                    // up
                                }

                                if value.translation.height > 0 {
                                    // down
                                    showScreen.toggle()
                                }
                            }))
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
        //        PopoverSecondViewView()
    }
}
