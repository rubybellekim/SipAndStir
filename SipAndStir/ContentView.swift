//
//  ContentView.swift
//  SipAndStir
//
//  Created by Ruby Kim on 2024-11-20.
//

import SwiftUI

struct ContentView: View {
    
    let cocktails: [String: Cocktail] = Bundle.main.decode("cocktails.json")
    let bases: [Base] = Bundle.main.decode("bases.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(bases) { base in
                        NavigationLink {
                            BaseView(base: base, cocktails: cocktails)
                        } label: {
                            VStack {
                                Image(base.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 150)
//                                    .clipShape(Circle())
                                    .padding()
                                
                                VStack {
                                    Text(base.displayName)
//                                        .font(.headline)
                                        .foregroundStyle(.black)
                                    
                                    Text(base.abvinfo)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
//                                .background(.lightBackground)
                                .background(.white)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.lightBackground)
                                    .stroke(.white.opacity(0.2))
                            )
                        }
                        .navigationDestination(for: Base.self) { selectedBase in
                            BaseView(base: selectedBase, cocktails: cocktails)
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Sip & Stir")
//            .toolbar {
//                                ToolbarItem(placement: .principal) {
//                                    Text("Sip & Stir")
//                                        .font(.title)
//                                        .foregroundColor(.white) // Change the title color
//                                }
//                            }
//            .background(.lightBackground)
//            .applyAppAppearance()
            .preferredColorScheme(.dark)
            .applyAppAppearance()
        }
    }
}

#Preview {
    ContentView()
}
