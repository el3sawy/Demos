//
//  TransactionDetailsView.swift
//  
//
//  Created by Osama Gamal on 08/05/2023.
//

import SwiftUI
import WOPDomain
import WOPDesignSystem

struct TransactionDetailsView: View {
    let transaction: WOPDomain.Transaction
    private var descriptionTextViewModel: TextViewModel? {
        if let desc = transaction.transactionDetail.description {
            return .init(text: desc, style: .text)
        }
        return nil
    }

    var body: some View {
        VStack {
            ListItemView(viewModel: .init(topTitle: .init(text: transaction.partnerDisplayName, style: .body), secondTitle: descriptionTextViewModel))
                .padding()
        }
        .navigationTitle("transaction_details_navigation_bar_title".localized)
        .navigationBarTitleDisplayMode(.inline)
    }
}
