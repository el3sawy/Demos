//
//  RouterView.swift
//  CustomView
//
//  Created by NTG Clarity on 03/07/2024.
//

import SwiftUI

struct RouterView: View {
    
    var arr = ["Ahmed", "KOK", "Mona", "Ali"]
    var arr1 = [1,2,3,4,56,6,8]
    var body: some View {
        VStack{
            Text(arr, format: .list(type: .and))
            Text(arr, format: .list(type: .or))
            Text(arr1, format: .list(memberStyle: .number, type: .and))
        }
        .onAppear(perform: {
            tt()
        })
    }
    
    func tt() {
    search: for (index, item) in zip(arr.indices,arr) {
            print(index , "  ", item)
        }
    }
}

#Preview {
    ViewDummy()
}


enum Route {
    case home
}
private struct NaviationKey: EnvironmentKey {
    static var defaultValue: (Route) -> Void = { _ in}
}

extension EnvironmentValues {
    var navigation: (Route) -> Void {
        get { self[NaviationKey.self] }
        set { self[NaviationKey.self] = newValue}
    }
}



struct ViewDummy: View {

   @State var selectedItem: TelawatType = .telawat
    var body: some View {
        HStack{
            ForEach(TelawatType.allCases, id: \.self) { item in
                Text(item.name)
                    .onTapGesture {
                        self.selectedItem = item
                    }
                    .background(selectedItem == item ? .red : .gray)
            }
        }
    }
}

enum TelawatType: CaseIterable {
    case telawat
    case test
    
    
    var name: String {
        switch self {
            
        case .telawat:
           return "تلاوات"
        case .test:
            return "خطب"
        }
    }
}
