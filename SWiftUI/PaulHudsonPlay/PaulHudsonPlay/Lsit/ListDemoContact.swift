//
//  ListDemoContact.swift
//  PaulHudsonPlay
//
//  Created by NTG on 17/07/2023.
//

import SwiftUI

struct ListDemoContact: View {
    
    @State var newWord = ""
    @State var words: [String] = []
    
    var body: some View {
        NavigationView {
            
            List {
                Section {
                    TextField("Add new word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(words, id: \.self) { item in
                        HStack {
                            Image(systemName: "\(item.count).square.fill")
                            Text(item)
                        }
                        
                    }
                }
                
            }
        }
        .onSubmit(addNewItem)
    }
    
    func addNewItem() {
        let word = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        withAnimation {
            words.append(word)
        }
        
        newWord = ""
    }
}

struct ListDemoContact_Previews: PreviewProvider {
    static var previews: some View {
        ListDemoContact()
    }
}
