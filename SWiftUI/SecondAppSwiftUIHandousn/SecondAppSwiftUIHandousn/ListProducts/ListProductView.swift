//
//  ListProductView.swift
//  SecondAppSwiftUIHandousn
//
//  Created by NTG on 05/08/2023.
//

import SwiftUI


struct ListProductView: View {
    @StateObject var viewModel = ListProductViewModel()
    var body: some View {
            VStack {
                Text(Date(), style: .relative)
                    .monospacedDigit()
                
                Text("**AHMED** [web](https://google.com)")
                    .tint(.green) // change web color
                let x = "**AHMED** [web](https://google.com)"
                Text(LocalizedStringKey(x))
                VStack(alignment: .leading) {
                    Text("ahmed")
                        .alignmentGuide(.leading) { d in d[.trailing]}
                    Text("Sleep")
                        .alignmentGuide(.trailing) { d in d[.leading]}
                    Text("Sleep")
//                        .alignmentGuide(.leading) { d in d[.trailing]}
                }
                .frame(width: 300)
                .background(.red)
                .padding()
                
                HStack(alignment: .bottom) {
                            Image(systemName: "heart")
                                .alignmentGuide(.bottom) { d in d[.bottom]  }
                            Text("Sleep")
                        }
                
                Text(Date(), style: .time)
//                    .redacted(reason: .placeholder )
                HeaderView(viewModel: viewModel.viewModel)
                    
                                
                //            Spacer()
                CarTypeView(onSelectedType: viewModel.onSelectedCar)
                
                    
            }
            

    }
}

struct ListProductView_Previews: PreviewProvider {
    static var previews: some View {
        ListProductView()
    }
}
