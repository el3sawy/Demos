//
//  ListCoffeeView.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 04/08/2023.
//

import SwiftUI

struct ListCoffeeView: View {
    @StateObject var menu = Menu()
    @State private var searchText = ""
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { section in // Sections
                        Section { // Items in section
                            ForEach(section.matches(for: searchText)) { drink in
                                NavigationLink {
                                    Text(drink.name)
                                } label: {
                                    VStack {
                                        Image(drink.image)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        
                                        Text(drink.name)
                                            .font(.system(.body, design: .serif))
                                    }
                                    .padding(.bottom)
                                }
                                .buttonStyle(.plain)
                                
                            }
                        } header: {
                            Text(section.name)
                                .padding(.leading)
                                .font(.system(.title, design: .serif))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(Color.gray)
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Add Drink")
            .searchable(text: $searchText, prompt: Text("Search by name"))
        }
        
    }
}

struct ListCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        ListCoffeeView()
    }
}
