//
//  Bayes.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 08.04.2023.
//

import Foundation

extension CriteriaProcessor {    
    func countBayesWinning() -> CriteriaResult {
        let resultList = matrix.map{
            $0.enumerated().reduce(0) {
                $0 + $1.element * chances[$1.offset]
            }
        }

        let result = resultList.firstIndex(of: resultList.max()!)!

        return CriteriaResult(strategiesResult: resultList, result: result)
    }
    
    func countBayesLoosing() -> CriteriaResult {
        let resultList = matrix.map{
            $0.enumerated().reduce(0) {
                $0 + $1.element * chances[$1.offset]
            }
        }
        
        let result = resultList.firstIndex(of: resultList.min()!)!
        
        return CriteriaResult(strategiesResult: resultList, result: result)
    }
}
