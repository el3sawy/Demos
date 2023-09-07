//
//  DatePickerView.swift
//  ControlViews
//
//  Created by Ahmed Elesawy on 06/04/2022.
//

import SwiftUI

struct DatePickerView: View {
    @State private var dateVale = Date()
    var body: some View {
        DatePicker("Date for text view", selection: $dateVale, displayedComponents: .date)
            .labelsHidden()
            .padding(.horizontal)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
