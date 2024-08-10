//
//  LayoutDemoView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 09/08/2024.
//
//https://www.youtube.com/watch?v=WD7ebJZ7PaI&t=81s
import SwiftUI

struct Rec: Identifiable {
    var color: Color
    var size: CGSize
    var id = UUID()
   static var demo: [Rec] = [
        .init(color: .red, size: .init(width: 100, height: 100)),
        .init(color: .blue, size: .init(width: 40, height: 90)),
        .init(color: .green, size: .init(width: 80, height: 120)),
        .init(color: .yellow, size: .init(width: 90, height: 79)),
    ]
}
struct LayoutDemoView: View {
    let recs = Rec.demo
//    @State var changeLayout = false
    @State var changeLayout: LayoutType = .hStack
    var body: some View {
//        let layout = changeLayout ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        let layout = AnyLayout(changeLayout.layout)
       NavigationStack {
           layout {
                ForEach(recs) { item in
                    
                    Rectangle()
                        .fill(item.color)
                        .frame(width: item.size.width, height: item.size.height)
                    
                }
                .animation(.smooth, value: changeLayout)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text(LayoutType.zStack.rawValue)
                            .foregroundStyle(.red)
                            .onTapGesture {
                                changeLayout = .zStack
                            }
                        
                        Text(LayoutType.vStack.rawValue)
                            .foregroundStyle(.red)
                            .onTapGesture {
                                changeLayout = .vStack
                            }
                        
                        Text(LayoutType.hStack.rawValue)
                            .foregroundStyle(.red)
                            .onTapGesture {
                                changeLayout = .hStack
                            }
                    }
                }
            }
        }
       
    }
}

#Preview {
    LayoutDemoView()
}



enum LayoutType: String {
    case zStack
    case hStack
    case vStack
    
    var layout: any Layout {
        switch self {
        case .zStack:
           return ZStackLayout()
        case .hStack:
            return HStackLayout()
        case .vStack:
            return VStackLayout(alignment: .leading)
        }
    }
}
