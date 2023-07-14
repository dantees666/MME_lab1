//
//  InputMatrixViewController.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 07.04.2023.
//

import Foundation
import UIKit

class InputMatrixViewController: UIViewController {
    var matrixInputView: MatrixInputView!
    
    var confirmMatrixButton: UIButton!
    
    let rowCount: Int
    let columnCount: Int
    let alpha: Double
    let chances: [Double]
    
    var gameMatrix: [[Double]] = [[]]
    
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
        createConfirmMatrixButton()
    }
}

// MARK: - Methods to create subviews

extension InputMatrixViewController {
    func createMatrixInput() {
        matrixInputView = MatrixInputView(rowCount: self.rowCount, columnCount: self.columnCount)
        matrixInputView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(matrixInputView)
        
        matrixInputView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        matrixInputView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        matrixInputView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        matrixInputView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func createConfirmMatrixButton() {
        confirmMatrixButton = UIButton()
        confirmMatrixButton.setTitle("Confirm matrix", for: .normal)
        confirmMatrixButton.backgroundColor = UIColor(red: 48/255, green: 180/255, blue: 99/255, alpha: 1)
        confirmMatrixButton.layer.cornerRadius = 15
        confirmMatrixButton.translatesAutoresizingMaskIntoConstraints = false
        confirmMatrixButton.addTarget(self, action: #selector(confirmMatrix), for: .touchUpInside)
        view.addSubview(confirmMatrixButton)
        
        confirmMatrixButton.topAnchor.constraint(equalTo: matrixInputView.bottomAnchor, constant: 50).isActive = true
        confirmMatrixButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        confirmMatrixButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

// MARK: - Methods for buttons actions

extension InputMatrixViewController {
    @objc func confirmMatrix() {
        guard checkIsMatrixinputCorrect() else {
            let alert = UIAlertController(
                title: "Incorrect parameters",
                message: "Please, check you matrix input",
                preferredStyle: .alert
            )
            alert.addAction(
                UIAlertAction(
                    title: NSLocalizedString(
                        "OK",
                        comment: "Default action"
                    ),
                    style: .default
                )
            )
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        print("It's OK")
    }
}

// MARK: - Auxiliarry methods

extension InputMatrixViewController {
    func checkIsMatrixinputCorrect() -> Bool {
        for matrixRow in 0...rowCount {
            for matrixColumn in 0...columnCount {
                guard
                    let matrixElement = ((
                        matrixInputView.matrixStackVIew
                            .arrangedSubviews[matrixRow] as! UIStackView
                    )
                        .arrangedSubviews[matrixColumn] as! UITextField)
                        .text
                else {
                    return false
                }
            
                if
                    matrixElement == "" ||
                    Double(matrixElement) == nil ||
                    Double(matrixElement)! < -1500 ||
                    Double(matrixElement)! > 1500
                {
                    return false
                }
            }
        }
        return true
    }
}
