//
//  CarTypeView.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 05/08/2023.
//

import SwiftUI

struct CarTypeView: View {
    let types = ["BMW", "KIA"]
    
    @State private var selectedItemId: String? = nil
    var onSelectedType: (String) -> Void
    var body: some View {
        HStack {
            ForEach(types, id: \.self) { item in
                Button {
                    selectedItemId = item
                    onSelectedType(item)
                } label: {
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedItemId == item ? .blue : .brown)
                        .cornerRadius(10)
                    
                }
                
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 10)
        .onAppear {
            selectedItemId = types.first
        }
    }
}

struct CarTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CarTypeView { ietm in
            print(ietm)
        }
    }
}
