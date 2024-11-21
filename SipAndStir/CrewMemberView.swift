//
//  CrewMemberView.swift
//  SipAndStir
//
//  Created by Ruby Kim on 2024-11-21.
//

import SwiftUI

struct CrewMemberView: View {
    
    let base: Base
    let crew: [CrewMember]
    
    var body: some View {
        //section divider
        SectionDivider()
        
        Text("Crew")
            .font(Font.custom("Didot", size: 25))
            .fontWeight(.bold)
            .padding(.bottom, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.mood) { crewMember in
                    NavigationLink {
                        CocktailView.init(cocktail: crewMember.cocktail)
                    } label: {
                        HStack {
                            Image(crewMember.cocktail.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.cocktail.name)
                                    .foregroundStyle(.white)
//                                    .font(.headline)
                                
                                Text(crewMember.mood)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                        .applyAppAppearance()
                    }
                }
            }
        }
    }
        
    init(base: Base, crew: [CrewMember]) {
        self.base = base
        self.crew = crew
    }
}

#Preview {
    let bases: [Base] = Bundle.main.decode("bases.json")
    let cocktails: [String: Cocktail] = Bundle.main.decode("cocktails.json")
    
    let crew = bases[0].crew.map { member in
        CrewMember(mood: member.mood, cocktail: cocktails[member.name]!)
    }
    
    return CrewMemberView(base: bases[0], crew: crew)
        .preferredColorScheme(.dark)
}
