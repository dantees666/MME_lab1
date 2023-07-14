//
//  CriteriaProcessor.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 14.07.2023.
//

import Foundation

class CriteriaProcessor {
    let matrix: [[Double]]
    let chances: [Double]
    let alpha: Double
    
    init(matrix: [[Double]], chances: [Double], alpha: Double) {
        self.matrix = matrix
        self.chances = chances
        self.alpha = alpha
    }
}
