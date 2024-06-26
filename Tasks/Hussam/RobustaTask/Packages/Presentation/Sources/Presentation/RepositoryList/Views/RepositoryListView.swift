//
//  RepositoryListView.swift
//  
//
//  Created by Hussam Elsadany on 4/8/23.
//

import Combine
import SwiftUI

public struct RepositoryListView: View {

    @ObservedObject var viewModel: RepositoryListViewModel
    @State private var query = ""
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.repos) { repository in
                    NavigationLink(destination: RepositoryRow(repository: repository)) {
                        RepositoryRow(repository: repository)
                    }
                }
            }
            .navigationTitle(viewModel.title)
            .searchable(text: $query, prompt: "Find Repo...")
            .onChange(of: query) { newQuery in
                viewModel.search(query: newQuery)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
                viewModel.fetchPublicReposList()
        }
        .alert(isPresented: $viewModel.showError, content: {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? "")
            )
        })
    }
}
