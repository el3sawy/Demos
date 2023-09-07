//
//  ActionSheetBootCamp.swift
//  BootcampSwiftUI
//
//  Created by Ahmed Elesawy on 09/04/2023.
//

import SwiftUI

struct ActionSheetBootCamp: View {
    
    @State var showSheet = false
    var body: some View {
        Button("Action Sheet") {
            showSheet.toggle()
        }
        .actionSheet(isPresented: $showSheet, content: getActionSheet)
    }
    
    
    func getActionSheet() -> ActionSheet {
//        return ActionSheet(title: Text("Hiiiii"))
        
        let button1: ActionSheet.Button = .default(Text("Default"))
        let button2: ActionSheet.Button = .destructive(Text(("destructive")))
        let button3: ActionSheet.Button = .cancel()
        
        return ActionSheet(title: Text("Title"), message: Text("Message"), buttons: [button1, button2, button3])
    
    }
}

struct ActionSheetBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBootCamp()
    }
}
