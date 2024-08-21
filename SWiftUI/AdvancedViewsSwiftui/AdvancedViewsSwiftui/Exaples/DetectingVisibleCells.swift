//
//  DetectingVisibleCells.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 11/08/2024.
//

import SwiftUI
//https://talk.objc.io/episodes/S01E406-detecting-visible-cells

struct DetectingVisibleCells: View {
    let items = Item.mock
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(items) { item in
                    cell(item: item)
                        .anchorPreference(key: VisibleItemsPreference2.self, value: .bounds, transform: { anchor in
                            [.init(item: item, bounds: anchor)]
                        })
                }
            }
        }
        .overlayPreferenceValue(VisibleItemsPreference2.self, { value in
            GeometryReader { proxy in
                let myFrame = proxy.frame(in: .local)
                let arr = value.sorted(by: { $0.item.number < $1.item.number }).map { item in
                    let inBounds = myFrame.intersects(proxy[item.bounds])
                    return (inBounds: inBounds, item: item.item)
                }
                let texts: [Text] = arr.map { (inBounds: Bool, item: Item) in
                    Text("\(item.number)")
                        .foregroundColor(inBounds ? .green : .red)
                }
                texts.joined(separator: Text(","))
                    .foregroundStyle(.white)
                    .background(.black)
                    .frame(maxHeight: .infinity)
            }
        })
    }
    
    func cell(item: Item) -> some View {
        Text(item.name)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .padding(.horizontal)
    }
}

#Preview {
    DetectingVisibleCells()
}

extension DetectingVisibleCells {
    struct Item: Identifiable, Hashable {
        var id = UUID()
        var number: Int
        
        var name: String {
            "Item \(number)"
        }
        static var mock: [Item] {
            (0..<100).map { Item(number: $0) }
        }
    }
}

extension DetectingVisibleCells {
    struct VisibleItemsPreference: PreferenceKey {
        static var defaultValue: [Payload] = []
        static func reduce(value: inout Value, nextValue: () -> Value) {
            value.append(contentsOf: nextValue())
        }
    }
    struct Payload {
        var item: Item
        var bounds: Anchor<CGRect>
    }
    struct VisibleItemsPreference2: PreferenceKey {
        static var defaultValue: [Payload] = []
        static func reduce(value: inout Value, nextValue: () -> Value) {
//            value.append(contentsOf: nextValue())
            value.append(nextValue().first!)
        }
    }
}
extension [Text] {
    func joined(separator: Text) -> Text {
        guard let f = first else { return Text("") }
        return dropFirst().reduce(f, { $0 + separator + $1 })
    }
}
