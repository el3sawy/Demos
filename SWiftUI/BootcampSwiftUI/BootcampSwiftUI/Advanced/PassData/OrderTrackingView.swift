//
//  OrderTrackingView.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Naguib on 18/02/2024.
//

import SwiftUI

struct OrderTrackingView: View {
    
    @State var isShowHeader = true
    var body: some View {
       VStack {
           if isShowHeader {
               header
           }
           
            ScrollView{
                LazyVStack {
                    Text("Ahmed")
                        .onChangeScrollView { value in
                            print(value)
//                            isShowHeader = value > 250
                            if !isShowHeader, value < 50 {
//                                isShowHeader = true
                            }
                            
                            if isShowHeader, value > 250 {
//                                isShowHeader = false
                            }
                            
                        }
                    ForEach(0..<10) { i in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.purple)
                            .frame(height: 100)
                    }
                }
            }
        }
        .padding(.top, 1)
    }
}

#Preview {
    OrderTrackingView()
}

private extension OrderTrackingView {
    var header: some View {
        Rectangle()
            .fill(Color.red)
            .frame(height: 220)
    }
}



//
//import SwiftUI
//
//struct ContentViewrr: View {
//    var header: some View {
//        Rectangle()
//            .fill(Color.red)
//            .frame(height: 220)
//    }
//    @State private var showingHeader = true
//    var body: some View {
//        VStack {
//            if showingHeader {
//                header
//                    .transition(
//                        .asymmetric(
//                            insertion: .push(from: .top),
//                            removal: .push(from: .bottom)
//                        )
//                    )
//            }
//            GeometryReader { outer in
//                let outerHeight = outer.size.height
//                ScrollView(.vertical) {
//                    content
//                        .background {
//                            GeometryReader { proxy in
//                                let contentHeight = proxy.size.height
//                                let minY = max(
//                                    min(0, proxy.frame(in: .named("ScrollView")).minY),
//                                    outerHeight - contentHeight
//                                )
//                                Color.clear
//                                    .onChange(of: minY) { oldVal, newVal in
//                                        if (showingHeader && newVal < oldVal) || !showingHeader && newVal > oldVal {
//                                            showingHeader = newVal > oldVal
//                                        }
//                                    }
//                            }
//                        }
//                }
//                .coordinateSpace(name: "ScrollView")
//            }
//            // Prevent scrolling into the safe area
//            .padding(.top, 1)
//        }
//        .background(.black)
//        .animation(.easeInOut, value: showingHeader)
//    }
//    }
//
//
//
struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
