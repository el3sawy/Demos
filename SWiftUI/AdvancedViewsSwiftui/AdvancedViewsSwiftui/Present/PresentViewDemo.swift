//
//  PresentViewDemo.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 24/09/2024.
//

import SwiftUI

struct PresentViewDemo: View {
    @State var present: Bool = false
    
    var body: some View {
        VStack {
            DetailsView()
                .redacted(reason: .placeholder)
            Button("Present") { present.toggle() }
            
        }
        .sheet(isPresented: $present){
            DetailsView()
                .presentationBackgroundInteraction(.enabled)
//                .presentationDetents([.medium,.large])
//                .presentationContentInteraction(.automatic)
            
            
            //                .presentationCompactAdaptation(.sheet)
            //                .presentationDragIndicator(.visible)
            //                .presentationBackground(.red)
                            .presentationCornerRadius(50)
            //                .presentationDetents([.medium])
            //                .interactiveDismissDisabled()
        }
    }
}

struct DetailsView: View {
    var body: some View {
        VStack {
            Text("Details")
            Text("Details")
            Text("Details")
        }
    }
}

#Preview {
    PresentViewDemo()
}
