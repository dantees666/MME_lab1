//
//  Laplas.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 09.04.2023.
//

import Foundation

class Laplas: CriteriaProcessor {
    let matrix: [[Double]] = [[5, 5, 7], [3, 4, 6], [2, 4, 8]]
    
    var chance: Double {
        return (1 / Double(matrix.first!.count) * 100).rounded() / 100
    }
    
    func countCriteriaWinning() -> CriteriaResult {
        let resultList = matrix.map{
            $0.reduce(0) {
                $0 + $1 * chance
            }
        }

        let result = resultList.firstIndex(of: resultList.max()!)!

        return CriteriaResult(strategiesResult: resultList, result: result)
    }
    
    func countCriteriaLoosing() -> CriteriaResult {
        let resultList = matrix.map{
            $0.reduce(0) {
                $0 + $1 * chance
            }
        }
        
        let result = resultList.firstIndex(of: resultList.min()!)!
        
        return CriteriaResult(strategiesResult: resultList, result: result)
    }
}
