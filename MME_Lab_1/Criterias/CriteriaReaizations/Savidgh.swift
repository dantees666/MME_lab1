//
//  Savidgh.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 09.04.2023.
//

import Foundation

extension InputMatrixViewController {
    func countSavidghWinning() -> CriteriaResult {
        let maxesInColumn = gameMatrix.first!.enumerated().map { column in
            gameMatrix.map {
                $0[column.offset]
            }.max()!
        }
        
        let resultList = gameMatrix.map { column in
            column.enumerated().map {
                maxesInColumn[$0.offset] - $0.element
            }.max()!
        }
        
        return CriteriaResult(strategiesResult: resultList, result: Int(resultList.min()!))
    }
    
    func countSavidghLoosing() -> CriteriaResult {
        let maxesInColumn = gameMatrix.first!.enumerated().map { column in
            gameMatrix.map {
                $0[column.offset]
            }.max()!
        }
        
        let resultList = gameMatrix.map { column in
            column.enumerated().map {
                maxesInColumn[$0.offset] - $0.element
            }.min()!
        }
        
        return CriteriaResult(strategiesResult: resultList, result: Int(resultList.max()!))
    }
}
