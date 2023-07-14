//
//  SaddlePoint.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 10.04.2023.
//

import Foundation

extension CriteriaProcessor {
    func countSaddlePoint() -> [(Int, Int)]? {
        let lowerValue = matrix.map {
            $0.min()!
        }.max()!
        
        let upperValue = matrix.first!.enumerated().map { column in
            matrix.map {
                $0[column.offset]
            }.max()!
        }.min()!
        
        if upperValue == lowerValue {
            return getMatrixElementIndex(element: upperValue)
        } else {
            return nil
        }
    }
    
    func getMatrixElementIndex(element: Double) -> [(Int, Int)] {
        var saddlePointIndexes: [(Int, Int)] = []
        
        let saddlePointIndexesList = matrix.enumerated().map {
            $0.element.enumerated().filter {
                $0.element == element
            }
        }

        for i in 0...(saddlePointIndexesList.count - 1) {
            saddlePointIndexesList[i].forEach { j in
                saddlePointIndexes.append((i,j.offset))
            }
        }
        
        return saddlePointIndexes
    }
}
