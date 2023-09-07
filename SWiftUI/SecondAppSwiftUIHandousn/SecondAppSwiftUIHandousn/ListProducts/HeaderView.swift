//
//  HeaderView.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 05/08/2023.
//

import SwiftUI

extension HeaderView {
    struct ViewModel {
        let name: String
        var onBookMark: () -> Void
        var onFav: () -> Void
    }
}

struct HeaderView: View {
      
    let viewModel: ViewModel
    
    var body: some View {
            ZStack(alignment: .trailing) {
                Image("kia")
                    .resizable()
//                    .scaledToFill()
                    .frame(height: 300)
               
                
//                LinearGradient(
//                    colors: [.clear, .black],
//                    startPoint: .top,
//                    endPoint: .bottom)
                
                VStack(alignment: .trailing) {
                    Button(action: viewModel.onFav) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    HStack {
                        Text("Namme")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Button(action: viewModel.onBookMark) {
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(.red)
                        }
                    }
                    
                }
                .padding()
                
            }
            .frame(height: 300)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(viewModel: .init(name: "", onBookMark: {
            print("Book")
        }, onFav: {
            print("Save")
        }))
    }
}
