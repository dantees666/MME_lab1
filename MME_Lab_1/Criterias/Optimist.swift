//
//  Optimist.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 08.04.2023.
//

import Foundation

class Optimist: CriteriaProcessor {
    let matrix: [[Double]] = [[5,5,7],[3,4,6],[2,4,8]]
    
    func countCriteriaWinning() -> CriteriaResult {
        let maxes = matrix.map { $0.max()! }
        let result = maxes.firstIndex(of: maxes.max()!)!
        
        return CriteriaResult(strategiesResult: maxes, result: result)
    }
    
    func countCriteriaLoosing() -> CriteriaResult {
        let mins = matrix.map { $0.min()! }
        let result = mins.firstIndex(of: mins.min()!)!
        
        return CriteriaResult(strategiesResult: mins, result: result)
    }
}
