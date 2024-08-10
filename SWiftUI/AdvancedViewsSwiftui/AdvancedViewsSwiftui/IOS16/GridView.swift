//
//  GridView.swift
//  AdvancedViewsSwiftui
//
//  Created by NTG Clarity on 08/08/2024.
//

import SwiftUI
//https://rohit-13.medium.com/exploring-the-swiftuis-grid-view-lazyvgrid-griditem-and-grid-gridrow-888fca958b0f
struct GridView: View {
    var body: some View {
        Grid(alignment: .bottom, horizontalSpacing: 10, verticalSpacing: 3) {
            GridRow {
                RoundedRectangle(cornerRadius: 22)
                    .fill(.gray)
                
                RoundedRectangle(cornerRadius: 22)
                    .fill(.green)
                    .gridCellColumns(2)
            }
            GridRow {
                RoundedRectangle(cornerRadius: 22).foregroundColor(.green)
                RoundedRectangle(cornerRadius: 22)
                    .foregroundColor(.clear)
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                RoundedRectangle(cornerRadius: 22).foregroundColor(.green)
            }
            Divider()
                .gridCellUnsizedAxes(.horizontal)
                .frame(height: 10)
            
            GridRow {
                RoundedRectangle(cornerRadius: 22)
                    .fill(.red)
                RoundedRectangle(cornerRadius: 22)
                    .fill(.black)
                RoundedRectangle(cornerRadius: 22)
                    .fill(.blue)
            }
            GridRow {
                RoundedRectangle(cornerRadius: 22)
                    .fill(.red)
                Text("KOKPO")
                    .gridColumnAlignment(.center)
                    .background(.purple)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                RoundedRectangle(cornerRadius: 22)
                    .fill(.blue)
            }
            
            
            GridRow {
                RoundedRectangle(cornerRadius: 22)
                    .fill(.gray)
                RoundedRectangle(cornerRadius: 22)
                    .fill(.green)
                
            }
            
            GridRow {
                Rectangle().foregroundColor(.orange).frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 20, height: 20)
                    .gridCellAnchor(UnitPoint(x: 0.25, y: 0.75))
                
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 20, height: 20)
                    .gridCellAnchor(.topTrailing)
            }
        }
        .padding()
    }
}

#Preview {
    GridView()
}
