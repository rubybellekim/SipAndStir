//
//  Base.swift
//  SipAndStir
//
//  Created by Ruby Kim on 2024-11-21.
//

import Foundation

struct Base: Codable, Identifiable, Hashable {
    struct CrewRole: Codable, Hashable {
        let name: String
        let mood: String
    }
    
    let id: String
    let ABV: String? //unwrap it when the data contains
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "\(id)"
    }
    
    var image: String {
        "\(id)"
    }
    
    var abvinfo: String {
        //ABV info, if not exist then denoted as "N/A"
        ABV ?? "N/A"
    }
}
