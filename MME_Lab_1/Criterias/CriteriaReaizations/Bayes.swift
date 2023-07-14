//
//  Bayes.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 08.04.2023.
//

import Foundation

class Bayes: CriteriaProcessor {
    let matrix: [[Double]] = [[5, 5, 7], [3, 4, 6], [2, 4, 8]]
    let chances: [Double] = [0.5, 0.4, 0.1]
    
    func countCriteriaWinning() -> CriteriaResult {
        let resultList = matrix.map{
            $0.enumerated().reduce(0) {
                $0 + $1.element * chances[$1.offset]
            }
        }

        let result = resultList.firstIndex(of: resultList.max()!)!

        return CriteriaResult(strategiesResult: resultList, result: result)
    }
    
    func countCriteriaLoosing() -> CriteriaResult {
        let resultList = matrix.map{
            $0.enumerated().reduce(0) {
                $0 + $1.element * chances[$1.offset]
            }
        }
        
        let result = resultList.firstIndex(of: resultList.min()!)!
        
        return CriteriaResult(strategiesResult: resultList, result: result)
    }
}
