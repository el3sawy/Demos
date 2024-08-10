//
//  TransactionView.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import SwiftUI
import WOPDomain
import WOPDesignSystem

struct TransactionView: View {
    let transaction: WOPDomain.Transaction
    var secondTitleViewModel: TextViewModel? {
        if let transactionDesc = transaction.transactionDetail.description {
            return TextViewModel(text: transactionDesc, style: .text)
        }
        return nil
    }
    
    var valueTitleViewModel: TextViewModel? {
        if let formattedValue = formatValue(transaction.transactionDetail.value) {
            return TextViewModel(text: formattedValue, style: .smallText)
        }
        return nil
    }

    var body: some View {
        let dateString = transaction.transactionDetail.bookingDate.locallyFormattedString

        ListItemView(viewModel: ListItemView.ViewModel(
            topTitle: TextViewModel(text: transaction.partnerDisplayName, style: .body),
            secondTitle: secondTitleViewModel,
            rightTitle: valueTitleViewModel,
            bottomTitle: TextViewModel(text: dateString, style: .mediumText),
            navigationDestination: {
                AnyView(TransactionDetailsView(transaction: transaction))
            }
        )
        )
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
    
    func formatValue(_ value: WOPDomain.Transaction.Value) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = value.currency

        return formatter.string(from: value.amount as NSNumber)
    }

}
