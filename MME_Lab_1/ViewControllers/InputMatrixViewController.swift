//
//  InputMatrixViewController.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 07.04.2023.
//

import Foundation
import UIKit

class InputMatrixViewController: UIViewController {
    var matrixInput: MatrixInputView!
    
    let rowCount: Int
    let columnCount: Int
    let alpha: Double
    let chances: [Double]
    
    init(rowCount: Int, columnCount: Int, alpha: Double, chances: [Double]) {
        self.rowCount = rowCount
        self.columnCount = columnCount
        self.alpha = alpha
        self.chances = chances
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMatrixInput()
    }
    
    func createMatrixInput() {
        matrixInput = MatrixInputView(rowCount: self.rowCount, columnCount: self.columnCount)
        matrixInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(matrixInput)
        
        matrixInput.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        matrixInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        matrixInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        matrixInput.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
