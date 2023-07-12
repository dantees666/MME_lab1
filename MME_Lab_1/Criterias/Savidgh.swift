//
//  Savidgh.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 09.04.2023.
//

import Foundation

class Savidgh: CriteriaProcessor {
    let matrix: [[Double]] = [[5, 5, 7], [3, 4, 6], [2, 4, 8]]
    
    func countCriteriaWinning() -> CriteriaResult {
        let maxesInColumn = matrix.first!.enumerated().map { column in
            matrix.map {
                $0[column.offset]
            }.max()!
        }
        
        let resultList = matrix.map { column in
            column.enumerated().map {
                maxesInColumn[$0.offset] - $0.element
            }.max()!
        }
        
        return CriteriaResult(strategiesResult: resultList, result: Int(resultList.min()!))
    }
    
    func countCriteriaLoosing() -> CriteriaResult {
        let maxesInColumn = matrix.first!.enumerated().map { column in
            matrix.map {
                $0[column.offset]
            }.max()!
        }
        
        let resultList = matrix.map { column in
            column.enumerated().map {
                maxesInColumn[$0.offset] - $0.element
            }.min()!
        }
        
        return CriteriaResult(strategiesResult: resultList, result: Int(resultList.max()!))
    }
}
