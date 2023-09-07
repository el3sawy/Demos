//
//  RateViewBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 24/04/2023.
//

import SwiftUI
struct ContentView3: View {
    @State var rating = 3

    var body: some View {
        RatingView(rating: $rating)
    }
}


struct RateViewBootCamp: View {
    
    @State var rating = 0
    var body: some View {
        ZStack {
            starsView
//                .overlay {
//                    overlayView
//                }
        }
    }
    
    var overlayView: some View {
        GeometryReader { geometry in
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width: CGFloat(rating / 5) * geometry.size.width)
                .mask(starsView)
        }
        .allowsTightening(false)
    }
    var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(index <= rating ? .yellow : .gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                        
                    }
            }
        }
    }
}

struct RateViewBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}


struct RatingView: View {
    @Binding var rating: Int

    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow

    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }

    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = number
                        }
                    }
            }
        }
    }
}
