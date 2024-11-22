//
//  CocktailView.swift
//  SipAndStir
//
//  Created by Ruby Kim on 2024-11-20.
//

import SwiftUI

struct CocktailView: View {
    let cocktail: Cocktail
    
    var body: some View {
        ScrollView {
            VStack {
                Image(cocktail.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding()
                
                Text(cocktail.description)
                    .padding()
            }
            .navigationTitle(cocktail.name)
            .navigationBarTitleDisplayMode(.inline)
            .applyAppAppearance()
        }
    }
}

#Preview {
    let cocktails: [String: Cocktail] = Bundle.main.decode("cocktails.json")
    
    return CocktailView(cocktail: cocktails["sidecar"]!)
        .preferredColorScheme(.dark)
}
