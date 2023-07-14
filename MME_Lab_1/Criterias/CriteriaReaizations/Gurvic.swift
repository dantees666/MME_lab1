//
//  Gurvic.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 09.04.2023.
//

import Foundation

extension CriteriaProcessor {
    func countGurvicWinning() -> CriteriaResult {
        let resultList = matrix.map {
            ((alpha * $0.min()! + (1 - alpha) * $0.max()!) * 100).rounded() / 100
        }
        
        return CriteriaResult(strategiesResult: resultList, result: resultList.firstIndex(of: resultList.max()!)!)
    }
    
    func countGurvicLoosing() -> CriteriaResult {
            let resultList = matrix.map {
                ((alpha * $0.max()! + (1 - alpha) * $0.min()!) * 100).rounded() / 100
            }
            
            return CriteriaResult(strategiesResult: resultList, result: resultList.firstIndex(of: resultList.min()!)!)
        }
}
