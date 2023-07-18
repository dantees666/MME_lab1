//
//  Optimist.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 08.04.2023.
//

import Foundation

extension InputMatrixViewController {
    func countOptimistWinning() -> CriteriaResult {
        let maxes = gameMatrix.map { $0.max()! }
        let result = maxes.firstIndex(of: maxes.max()!)!
        
        return CriteriaResult(strategiesResult: maxes, result: result)
    }
    
    func countOptimistLoosing() -> CriteriaResult {
        let mins = gameMatrix.map { $0.min()! }
        let result = mins.firstIndex(of: mins.min()!)!
        
        return CriteriaResult(strategiesResult: mins, result: result)
    }
}
