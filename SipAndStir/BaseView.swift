//
//  BaseView.swift
//  SipAndStir
//
//  Created by Ruby Kim on 2024-11-20.
//

import SwiftUI

struct BaseView: View {
    
    let base: Base
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image(base.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {
                        width, axis in width * 0.6
                    }
                
                VStack(alignment: .center) {
                    Text("ABV: \(base.abvinfo)")
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                VStack(alignment: .leading) {
                    
                    //custom section divider from Extension
                    SectionDivider()

                    Text("Highlights")
                        .font(Font.custom("Didot", size: 25))
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    Text(base.description)

                    CrewMemberView(base: base, crew: crew)
                }
                .padding(.horizontal)

            }
            .padding(.bottom)
        }
        .navigationTitle(base.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .applyAppAppearance()
    }
    
    init(base: Base, cocktails: [String: Cocktail]) {
        self.base = base
        self.crew = base.crew.map { member in
            if let cocktail = cocktails[member.name] {
                return CrewMember(mood: member.mood, cocktail: cocktail)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let bases: [Base] = Bundle.main.decode("bases.json")
    let cocktails: [String: Cocktail] = Bundle.main.decode("cocktails.json")
    
    return BaseView(base: bases[0], cocktails: cocktails)
        .preferredColorScheme(.dark)
}
