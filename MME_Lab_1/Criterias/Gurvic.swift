//
//  Gurvic.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 09.04.2023.
//

import Foundation

class Gurvic: CriteriaProcessor {
    let matrix: [[Double]] = [[5, 5, 7], [3, 4, 6], [2, 4, 8]]
    
    let alpha: Double = 0.4
    
    func countCriteriaWinning() -> CriteriaResult {
        let resultList = matrix.map {
            ((alpha * $0.max()! + (1 - alpha) * $0.min()!) * 100).rounded() / 100
        }
        
        return CriteriaResult(strategiesResult: resultList, result: resultList.firstIndex(of: resultList.min()!)!)
    }
    
    func countCriteriaLoosing() -> CriteriaResult {
        let resultList = matrix.map {
            ((alpha * $0.min()! + (1 - alpha) * $0.max()!) * 100).rounded() / 100
        }
        
        return CriteriaResult(strategiesResult: resultList, result: resultList.firstIndex(of: resultList.max()!)!)
    }
}
