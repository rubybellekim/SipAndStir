//
//  Cocktail.swift
//  SipAndStir
//
//  Created by Ruby Kim on 2024-11-21.
//

import Foundation

struct Cocktail: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}

