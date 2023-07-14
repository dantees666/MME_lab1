//
//  Wald.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 06.04.2023.
//

import Foundation

extension CriteriaProcessor {
    func countValdWinning() -> CriteriaResult {
        let mins = matrix.map { $0.min()! }
        let result = mins.firstIndex(of: mins.max()!)!
        
        return CriteriaResult(strategiesResult: mins, result: result)
    }
    
    func countValdLoosing() -> CriteriaResult {
        let maxes = matrix.map { $0.max()! }
        let result = maxes.firstIndex(of: maxes.min()!)!
        
        return CriteriaResult(strategiesResult: maxes, result: result)
    }
}
