//
//  MatrixInputView.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 08.04.2023.
//

import Foundation
import UIKit

class MatrixInputView: UIView {
    var matrixStackVIew: UIStackView!
    
    var rowCount: Int
    var columnCount: Int
    
    init(rowCount: Int, columnCount: Int) {
        self.rowCount = rowCount
        self.columnCount = columnCount
        super.init(frame: .zero)
        createStack()
        createMatrix()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createStack() {
        matrixStackVIew = UIStackView()
        matrixStackVIew.axis = .vertical
        matrixStackVIew.distribution = .fillEqually
        matrixStackVIew.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.matrixStackVIew)
        
        matrixStackVIew.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        matrixStackVIew.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        matrixStackVIew.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        matrixStackVIew.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func createMatrix() {
        for rowIndex in 0...rowCount {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            
            for columnIndex in 0...columnCount {
                let textField = UITextField()
                textField.placeholder = "\(rowIndex):\(columnIndex)"
                textField.textAlignment = .center
                stack.addArrangedSubview(textField)
            }
            
            matrixStackVIew.addArrangedSubview(stack)
        }
    }
}
