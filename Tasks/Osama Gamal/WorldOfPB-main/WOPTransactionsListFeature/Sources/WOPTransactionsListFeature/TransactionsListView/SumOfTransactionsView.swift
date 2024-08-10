//
//  File.swift
//  
//
//  Created by Osama Gamal on 08/05/2023.
//

import SwiftUI
import WOPDomain

struct SumOfTransactionsView: View {
    var sumOfTransactions: [String: WOPDomain.Transaction.Value]
    var sumOfTransactionsText: String {
        return sumOfTransactions.reduce("") { (result, entry) in
            let (currency, value) = entry
            let amount = value.amount
            return result + (result.isEmpty ? "" : ", ") + "\(amount) \(currency) "
        }
    }
    
    var body: some View {
        VStack {
            Text("sum_of_transactions".localized)
            Text(sumOfTransactionsText)
        }.frame(maxWidth: .infinity)
    }
}
