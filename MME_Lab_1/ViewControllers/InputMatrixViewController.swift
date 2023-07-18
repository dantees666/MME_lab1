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
    
    var saddlePointTextField: UITextField!
    var answerTableView: UITableView!
    
    let rowCount: Int
    let columnCount: Int
    let isWinning: Bool
    let alpha: Double
    let chances: [Double]
    
    var gameMatrix: [[Double]] = []
    
    init(rowCount: Int, columnCount: Int, isWinning: Bool, alpha: Double, chances: [Double]) {
        self.rowCount = rowCount
        self.columnCount = columnCount
        self.isWinning = isWinning
        self.alpha = alpha
        self.chances = chances
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserversForKeyboard()
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
    
    func createSaddlePointTextField() {
        saddlePointTextField = UITextField()
        saddlePointTextField.translatesAutoresizingMaskIntoConstraints = false
        saddlePointTextField.isEnabled = false
        saddlePointTextField.text = fillSaddlePoint()
        view.addSubview(saddlePointTextField)
        
        saddlePointTextField.topAnchor.constraint(equalTo: confirmMatrixButton.bottomAnchor, constant: 50).isActive = true
        saddlePointTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        saddlePointTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func createAnswerTableView() {
        answerTableView = UITableView()
        answerTableView.translatesAutoresizingMaskIntoConstraints = false
        answerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        answerTableView.dataSource = self
        answerTableView.delegate = self
        view.addSubview(answerTableView)
        
        answerTableView.topAnchor.constraint(equalTo: saddlePointTextField.bottomAnchor, constant: 50).isActive = true
        answerTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        answerTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        answerTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
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
        
        fillMatrix()
        createSaddlePointTextField()
        createAnswerTableView()
    }
}

// MARK: - Auxiliarry methods

extension InputMatrixViewController {
    func addObserversForKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
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
    
    func fillMatrix() {
        gameMatrix.removeAll()
        
        for matrixRow in 0...rowCount {
            var row: [Double] = []
            for matrixColumn in 0...columnCount {
                guard
                    let matrixElement = ((
                        matrixInputView.matrixStackVIew
                            .arrangedSubviews[matrixRow] as! UIStackView
                    )
                        .arrangedSubviews[matrixColumn] as! UITextField)
                        .text
                else {
                    return
                }
                
                row.append(Double(matrixElement)!)
            }
            
            gameMatrix.append(row)
        }
    }
    
    func fillSaddlePoint() -> String {
        guard let saddlePoint = countSaddlePoint() else {
            return "No saddle point"
        }
        
        return "Saddle point: \(saddlePoint)"
    }
    
    func fillAnswerTableView(_ criteriaIndex: Int) -> String {
        switch isWinning {
        case true:
            let result = getWinningResult(CriteriasNames(rawValue: criteriaIndex)!)
            return "\(CriteriasNames(rawValue: criteriaIndex)!.stringRepresentation) best strategy = \(result.result)\nresult = \(result.strategiesResult)"
        case false:
            let result = getLoosingResult(CriteriasNames(rawValue: criteriaIndex)!)
            return "\(CriteriasNames(rawValue: criteriaIndex)!.stringRepresentation) best strategy = \(result.result)\nresult = \(result.strategiesResult)"
        }
    }
    
    func getWinningResult(_ criteriaName: CriteriasNames) -> CriteriaResult {
        switch criteriaName {
        case .vald:
            return countValdWinning()
        case .gurvic:
            return countGurvicWinning()
        case .laplas:
            return countLaplasWinning()
        case .savidgh:
            return countSavidghWinning()
        case .optimist:
            return countOptimistWinning()
        case .bayes:
            return countBayesWinning()
        }
    }
    
    func getLoosingResult(_ criteriaName: CriteriasNames) -> CriteriaResult {
        switch criteriaName {
        case .vald:
            return countValdLoosing()
        case .gurvic:
            return countGurvicLoosing()
        case .laplas:
            return countLaplasLoosing()
        case .savidgh:
            return countSavidghLoosing()
        case .optimist:
            return countOptimistLoosing()
        case .bayes:
            return countBayesLoosing()
        }
    }
}

extension InputMatrixViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 20)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = fillAnswerTableView(indexPath.row)
          return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        answerTableView.frame.height / 6
    }
}
