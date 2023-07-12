//
//  ProbabilitiesInputView.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 07.04.2023.
//

import Foundation
import UIKit

class ProbabilitiesInputView: UIView {
    var stackView: UIStackView!
    var columnCount: Int
    
    init(columnCount: Int) {
        self.columnCount = columnCount
        super.init(frame: .zero)
        createStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createStackView() {
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        createInputLables()
    }
    
    func createInputLables() {
        for textFieldNumber in 0...columnCount {
            let textField = UITextField()
            textField.placeholder = "p\(textFieldNumber + 1)"
            textField.textAlignment = .center
            stackView.addArrangedSubview(textField)
        }
    }
}
