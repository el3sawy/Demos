//
//  TransactionsListView.swift
//  WorldOfPAYBACK
//
//  Created by Osama Gamal on 04/05/2023.
//

import SwiftUI
import WOPDomain
import WOPDesignSystem

struct TransactionsListView: View {
    @StateObject var viewModel: TransactionsListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.state {
                case .loading:
                    loadingView()
                case .idle:
                    EmptyView()
                case .error:
                    errorView {
                        Task {
                            await viewModel.fetchTransactions()
                        }
                    }
                case .empty:
                    emptyTransactionsView()
                case .content(let transactions):
                    contentView(transactions)
                }
            }
            .navigationTitle("navigation_bar_title".localized)
        }
        .onAppear {
            Task {
                await viewModel.fetchTransactions()
            }
        }
    }
}


//MARK: Content View
extension TransactionsListView {
    @ViewBuilder private func contentView(_ transactions: [WOPDomain.Transaction]) -> some View {
        List {
            Section {
                CategoryFilterView(categories: viewModel.categories,
                                   selectedCategory: viewModel.selectedCategory,
                                    didSelectTileAtIndex: { index in
                    viewModel.didSelectCategoryAtIndex(index)
                })
                .listRowSeparator(.hidden)
            }
            
            Section {
                ForEach(transactions, id: \.self) { transaction in
                    TransactionView(transaction: transaction)
                }
            } header: {
                if let sumOfTransacations = viewModel.sumOfTransacations {
                    SumOfTransactionsView(sumOfTransactions: sumOfTransacations)
                }
            }
        }
        .listStyle(.plain)
    }
}

//MARK: Loading View
extension TransactionsListView {
    @ViewBuilder private func loadingView() -> some View {
        List {
            ForEach((1...6), id: \.self) {_ in
                ListItemView(viewModel: ListItemView.ViewModel(topTitle: TextViewModel(text: "", style: .body), secondTitle: TextViewModel(text: "", style: .text), bottomTitle: TextViewModel(text: "", style: .text)))
                    .listRowSeparator(.hidden)
                    .shimmer()
            }
        }
        .listStyle(.plain)
    }
}

//MARK: Idle View
extension TransactionsListView {
    @ViewBuilder private func emptyTransactionsView() -> some View {
        Text("empty_transactiosn".localized)
    }
}

//MARK: Idle View
extension TransactionsListView {
    @ViewBuilder private func errorView(retryAction: @escaping () -> Void) -> some View {
        VStack {
            Text("transactions_fetch_error_text".localized)
            Button("retry".localized, action: retryAction)
        }
    }
}

