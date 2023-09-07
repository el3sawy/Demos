//
//  MissionView.swift
//  PaulHudsonPlay
//
//  Created by NTG on 21/07/2023.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}
struct MissionView: View {
    
    
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image("apollo1")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    CustomDivider()
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        CustomDivider()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        CrewView(crews: crew)
                    }
                    
                }
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}

struct CustomDivider: View {
    var body: some View {
        Divider()
            .frame(height: 4)
            .background(.darkBackground)
            .padding(.horizontal)
    }
}



struct CrewView: View {
    let crews: [CrewMember]
    
    var body: some View {
        HStack {
            ForEach(crews, id: \.role) { crewMember in
                NavigationLink {
                    AstronautView(astronaut: crewMember.astronaut)
                } label: {
                    HStack {
                        Image(crewMember.astronaut.id)
                            .resizable()
                            .frame(width: 104, height: 72)
                            .clipShape(Capsule())
                            .overlay {
                                Capsule()
                                    .stroke(.white)
                            }
                        
                        VStack(alignment: .leading) {
                            Text(crewMember.astronaut.name)
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            Text(crewMember.role)
                                .foregroundColor(.secondary)
                        }
                    }
                }

            }
        }
    }
}
