//
//  SaddlePoint.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 10.04.2023.
//

import Foundation

extension InputMatrixViewController {
    func countSaddlePoint() -> [(Int, Int)]? {
        let lowerValue = gameMatrix.map {
            $0.min()!
        }.max()!
        
        let upperValue = gameMatrix.first!.enumerated().map { column in
            gameMatrix.map {
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
        
        let saddlePointIndexesList = gameMatrix.enumerated().map {
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
