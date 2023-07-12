//
//  CountCriteria.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 06.04.2023.
//

import Foundation

protocol CriteriaProcessor {
    func countCriteriaWinning() -> CriteriaResult
    
    func countCriteriaLoosing() -> CriteriaResult
}
