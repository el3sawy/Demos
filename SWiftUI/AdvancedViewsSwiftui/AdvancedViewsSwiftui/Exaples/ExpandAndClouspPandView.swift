//
//  ExpandAndClouspPandView.swift
//  AdvancedViewsSwiftui
//
//  Created by Mac on 05/09/2024.
//

import SwiftUI

struct ExpandAndClouspPandView: View {

    @State private var expandedSections: Set<Int> = []

    let sections = [
        "Fruits": ["Apple", "Banana", "Orange"],
        "Vegetables": ["Carrot", "Broccoli", "Pepper"],
        "Dairy": ["Milk", "Cheese", "Yogurt"]]

    var body: some View {

        List {

            ForEach(Array(sections.keys.enumerated()), id: \.element) { index, key in
                HeaderSection(contents: sections[key] ?? [], titile: key)
            }



        }
        .background(Color.white)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
    }



    private func toggleSection(_ index: Int) {
        if expandedSections.contains(index) {
            expandedSections.remove(index)
        } else {
            expandedSections.insert(index)
        }
    }
}

struct HeaderSection: View {
    let contents: [String]
    let titile: String
    @State var show = true
    var body: some View {
        Section {
            if show {
                ForEach(contents, id: \.self) { i in
                    Text(i)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            print("\(i)")
                        }
                }
            }


        } header: {
            Text(titile)
                .onTapGesture {
                    show.toggle()
                }
        }

    }
}





#Preview {
    ExpandAndClouspPandView()
}




struct HeaderView: View {
    let title: String
    let isExpanded: Bool
    let onTap: () -> Void

    var body: some View {
        HStack {
            Text(title)
            //                .font(.headline)
            Spacer()
            Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
        }
        .contentShape(Rectangle()) // Makes the whole row tappable
        .onTapGesture {
            onTap()
        }
    }
}





struct CustomDisclosureGroup<Label: View, Content: View>: View {
    @State private var isExpanded: Bool = false
    let label: () -> Label
    let content: () -> Content

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    label()
                    Image(systemName: isExpanded ? "checkmark" : "heart")
                }
            }

            if isExpanded {
                content()
                    .transition(.scale)
            }
        }
    }
}
