//
//  ListItemView.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import SwiftUI

public struct ListItemView: View {
    public init(viewModel: ListItemView.ViewModel) {
        self.viewModel = viewModel
    }
    
    let viewModel: ViewModel

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(viewModel.topTitle.text)
                    .style(viewModel.topTitle.style)
                if let secondTitle = viewModel.secondTitle {
                    Text(secondTitle.text)
                        .style(secondTitle.style)
                }
                if let bottomTitle = viewModel.bottomTitle {
                    Text(bottomTitle.text)
                        .style(bottomTitle.style)
                }
            }
            Spacer()
            if let rightTitle = viewModel.rightTitle {
                Text(rightTitle.text)
                    .style(rightTitle.style)
            }
            if viewModel.navigationDestination() != nil {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
                
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.15), radius: 7, x: 0, y: 0)
        .background(
            NavigationLink("", destination: viewModel.navigationDestination)
                .opacity(0)
        )
    }
}

extension ListItemView {
    public struct ViewModel {
        public init(topTitle: TextViewModel,
                    secondTitle: TextViewModel? = nil,
                    rightTitle: TextViewModel? = nil,
                    bottomTitle: TextViewModel? = nil,
                    navigationDestination: @escaping () -> AnyView? = { nil }) {
            self.topTitle = topTitle
            self.secondTitle = secondTitle
            self.rightTitle = rightTitle
            self.bottomTitle = bottomTitle
            self.navigationDestination = navigationDestination
        }
        
        
        public let topTitle: TextViewModel
        public let secondTitle: TextViewModel?
        public let rightTitle: TextViewModel?
        public let bottomTitle: TextViewModel?
        
        public let navigationDestination: () -> AnyView?
    }
}
