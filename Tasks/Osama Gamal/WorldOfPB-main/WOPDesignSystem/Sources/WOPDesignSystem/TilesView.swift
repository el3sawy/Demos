//
//  TilesView.swift
//  
//
//  Created by Osama Gamal on 07/05/2023.
//

import Foundation

import SwiftUI

public protocol TilesViewDelegate: AnyObject {
    func didTapTileAtIndex(_ index: Int)
}
public struct TilesView: View {
    public init(viewModel: TilesView.ViewModel,
                didSelectTileAtIndex: @escaping ((Int) -> ())) {
        self.viewModel = viewModel
        self.didSelectTileAtIndex = didSelectTileAtIndex
    }
    
    let viewModel: ViewModel
    var didSelectTileAtIndex: ((Int) -> ())?

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 10) {
                ForEach(Array(viewModel.tiles.enumerated()), id: \.offset) { index, tile in
                    Button(action: {
                        didSelectTileAtIndex?(index)
                    }) {
                        Text(tile.title.text)
                            .style(tile.title.style)
                            .padding(10)
                            .background(tile.isSelected ? Color.black : Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

extension TilesView {
    public struct TileViewModel {
        public init(title: TextViewModel,
                    isSelected: Bool) {
            self.title = title
            self.isSelected = isSelected
        }
        
        public let title: TextViewModel
        public let isSelected: Bool
    }
    
    public struct ViewModel {
        public init(tiles: [TilesView.TileViewModel]) {
            self.tiles = tiles
        }
        
        public let tiles: [TileViewModel]
    }
}
