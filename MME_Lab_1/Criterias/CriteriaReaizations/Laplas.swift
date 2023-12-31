//
//  Laplas.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 09.04.2023.
//

import Foundation

extension InputMatrixViewController {
    var chance: Double {
        return (1 / Double(gameMatrix.first!.count) * 100).rounded() / 100
    }
    
    func countLaplasWinning() -> CriteriaResult {
        let resultList = gameMatrix.map{
            $0.reduce(0) {
                $0 + $1 * chance
            }
        }

        let result = resultList.firstIndex(of: resultList.max()!)!

        return CriteriaResult(strategiesResult: resultList, result: result)
    }
    
    func countLaplasLoosing() -> CriteriaResult {
        let resultList = gameMatrix.map{
            $0.reduce(0) {
                $0 + $1 * chance
            }
        }
        
        let result = resultList.firstIndex(of: resultList.min()!)!
        
        return CriteriaResult(strategiesResult: resultList, result: result)
    }
}
