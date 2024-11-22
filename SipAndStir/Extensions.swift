//
//  Extensions.swift
//  SipAndStir
//
//  Created by Ruby Kim on 2024-11-21.
//

import Foundation
import SwiftUI

struct CrewMember {
    let mood: String
    let cocktail: Cocktail
}

struct SectionDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 0.5)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}
