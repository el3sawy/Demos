//
//  ListMissionsView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 21/07/2023.
//

import SwiftUI

struct ListMissionsView: View {
    let missions: [Mission] = Bundle.main.decode("missions")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts")
    private let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 15)
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.lightBackground)
                                
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
        }
    }
}

struct ListMissionsView_Previews: PreviewProvider {
    static var previews: some View {
        ListMissionsView()
    }
}
