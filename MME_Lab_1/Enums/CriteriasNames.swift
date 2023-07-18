//
//  CriteriasNames.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 15.07.2023.
//

import Foundation

enum CriteriasNames: Int {
    //case saddlePont = "Saddle Point"
    case vald
    case gurvic
    case laplas
    case savidgh
    case optimist
    case bayes
    
    static let mapper: [CriteriasNames: String] = [
        .vald: "Vald",
        .gurvic: "Gurvic",
        .laplas: "Laplas",
        .savidgh: "Savidgh",
        .optimist: "Optimist",
        .bayes: "Bayes",
    ]
    
    var stringRepresentation: String {
        CriteriasNames.mapper[self]!
    }
}
