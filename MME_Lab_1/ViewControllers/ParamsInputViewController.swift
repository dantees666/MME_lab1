//
//  ViewController.swift
//  MME_Lab_1
//
//  Created by Андрей Буянов on 06.04.2023.
//

import UIKit

class ParamsInputViewController: UIViewController {
    var matrixSizePicker: UIPickerView!
    var matrixSizeHint: UILabel!
    
    var isWinningMatrixChecker: UISwitch!
    var isWinningMatrixHint: UILabel!
    
    var matrixParametersSubmition: UIButton!
    
    var probabilitiesTableHint: UILabel!
    var probabilitiesInput: ProbabilitiesInputView!
    
    var alphaHint: UILabel!
    var alphaInput: UITextField!
    
    var additionParametersSubmition: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addObserversForKeyboard()
        createSubviews()
    }
    
    func createSubviews() {
        createMatrixSizePicker()
        createMatrixSizeHint()
        createIsWinningMatrixChecker()
        createIsWinningMatrixHint()
        createMatrixParametersSubmition()
    }
}

// MARK: - Methods to create subviews

extension ParamsInputViewController {
    func createMatrixSizePicker() {
        matrixSizePicker = UIPickerView()
        matrixSizePicker.translatesAutoresizingMaskIntoConstraints = false
        matrixSizePicker.delegate = self
        matrixSizePicker.dataSource = self
        view.addSubview(matrixSizePicker)
        
        matrixSizePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        matrixSizePicker.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func createMatrixSizeHint() {
        matrixSizeHint = UILabel()
        matrixSizeHint.text = " Choose row and column count:"
        matrixSizeHint.textAlignment = .center
        matrixSizeHint.numberOfLines = 0
        matrixSizeHint.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(matrixSizeHint)
        
        matrixSizeHint.centerYAnchor.constraint(equalTo: matrixSizePicker.centerYAnchor).isActive = true
        matrixSizeHint.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        matrixSizeHint.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        matrixSizePicker.leadingAnchor.constraint(equalTo: matrixSizeHint.trailingAnchor, constant: 20).isActive = true
    }
    
    func createIsWinningMatrixChecker() {
        isWinningMatrixChecker = UISwitch()
        isWinningMatrixChecker.isOn = true
        isWinningMatrixChecker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(isWinningMatrixChecker)
        
        isWinningMatrixChecker.topAnchor.constraint(equalTo: matrixSizePicker.bottomAnchor, constant: 20).isActive = true
        isWinningMatrixChecker.widthAnchor.constraint(equalToConstant: 50).isActive = true
        isWinningMatrixChecker.centerXAnchor.constraint(equalTo: matrixSizePicker.centerXAnchor).isActive = true
    }
    
    func createIsWinningMatrixHint() {
        isWinningMatrixHint = UILabel()
        isWinningMatrixHint.text = "Find solution for winning matrix?"
        isWinningMatrixHint.textAlignment = .center
        isWinningMatrixHint.numberOfLines = 0
        isWinningMatrixHint.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(isWinningMatrixHint)
        
        isWinningMatrixHint.centerYAnchor.constraint(equalTo: isWinningMatrixChecker.centerYAnchor).isActive = true
        isWinningMatrixHint.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        isWinningMatrixHint.widthAnchor.constraint(equalToConstant: 200).isActive = true
        isWinningMatrixHint.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    func createMatrixParametersSubmition() {
        matrixParametersSubmition = UIButton()
        matrixParametersSubmition.setTitle("Submit", for: .normal)
        matrixParametersSubmition.backgroundColor = UIColor(red: 48/255, green: 180/255, blue: 99/255, alpha: 1)
        matrixParametersSubmition.layer.cornerRadius = 15
        matrixParametersSubmition.translatesAutoresizingMaskIntoConstraints = false
        matrixParametersSubmition.addTarget(self, action: #selector(submitMatrixSize), for: .touchUpInside)
        view.addSubview(matrixParametersSubmition)
        
        matrixParametersSubmition.topAnchor.constraint(equalTo: isWinningMatrixHint.bottomAnchor, constant: 50).isActive = true
        matrixParametersSubmition.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        matrixParametersSubmition.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func createProbabilitiesTableHint() {
        probabilitiesTableHint = UILabel()
        probabilitiesTableHint.text = "Enter strategy probabilities in order:"
        probabilitiesTableHint.textAlignment = .center
        probabilitiesTableHint.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(probabilitiesTableHint)
        
        probabilitiesTableHint.topAnchor.constraint(equalTo: matrixParametersSubmition.bottomAnchor, constant: 50).isActive = true
        probabilitiesTableHint.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    func createProbabilitiesInput(columnCount: Int) {
        probabilitiesInput = ProbabilitiesInputView(columnCount: columnCount)
        probabilitiesInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(probabilitiesInput)
        
        probabilitiesInput.topAnchor.constraint(equalTo: probabilitiesTableHint.bottomAnchor, constant: 20).isActive = true
        probabilitiesInput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        probabilitiesInput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        probabilitiesInput.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func createAlphaHint() {
        alphaHint = UILabel()
        alphaHint.text = "Input alpha for Gurvic criteria:"
        alphaHint.textAlignment = .center
        alphaHint.numberOfLines = 0
        alphaHint.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alphaHint)
        
        alphaHint.topAnchor.constraint(equalTo: probabilitiesInput.bottomAnchor, constant: 20).isActive = true
        alphaHint.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        alphaHint.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func createAlphaInput() {
        alphaInput = UITextField()
        alphaInput.placeholder = "a"
        alphaInput.textAlignment = .center
        alphaInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alphaInput)
        
        alphaInput.centerYAnchor.constraint(equalTo: alphaHint.centerYAnchor).isActive = true
        alphaInput.centerXAnchor.constraint(equalTo: isWinningMatrixChecker.centerXAnchor).isActive = true
    }
    
    func createAdditionParametersSubmition() {
        additionParametersSubmition = UIButton()
        additionParametersSubmition.setTitle("Input matrix", for: .normal)
        additionParametersSubmition.backgroundColor = UIColor(red: 48/255, green: 180/255, blue: 99/255, alpha: 1)
        additionParametersSubmition.layer.cornerRadius = 15
        additionParametersSubmition.translatesAutoresizingMaskIntoConstraints = false
        additionParametersSubmition.addTarget(self, action: #selector(startMatrixInput), for: .touchUpInside)
        view.addSubview(additionParametersSubmition)
        
        additionParametersSubmition.topAnchor.constraint(equalTo: alphaHint.bottomAnchor, constant: 50).isActive = true
        additionParametersSubmition.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        additionParametersSubmition.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

// MARK: - Methods for buttons actions

extension ParamsInputViewController {
    @objc func submitMatrixSize(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.2, animations: { [weak self] in
            self?.matrixParametersSubmition.alpha = 0.5
            
            if self?.probabilitiesInput != nil {
                self?.probabilitiesInput.removeFromSuperview()
                self?.createProbabilitiesInput(columnCount: self?.matrixSizePicker.selectedRow(inComponent: 1) ?? 4)
                self?.updateConstraintsForAlpha()
            } else {
                self?.createProbabilitiesTableHint()
                self?.createProbabilitiesInput(columnCount: self?.matrixSizePicker.selectedRow(inComponent: 1) ?? 4)
                self?.createAlphaHint()
                self?.createAlphaInput()
                self?.createAdditionParametersSubmition()
            }
            
            self?.matrixParametersSubmition.alpha = 1
        })
    }
    
    @objc func startMatrixInput() {
        guard checkIsChancesCorrect(), checkIsAlphaCorrect() else {
            let alert = UIAlertController(
                title: "Incorrect parameters",
                message: "Please, check you input parameters",
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
        
        let params = processParameters()
        
        UIButton.animate(withDuration: 0.2, animations: { [weak self] in
            self?.additionParametersSubmition.alpha = 0.5
            self?.showMatrixInput(params)
            self?.additionParametersSubmition.alpha = 1
        })
    }
}

// MARK: - Auxiliarry methods

extension ParamsInputViewController {
    func updateConstraintsForAlpha() {
        alphaHint.topAnchor.constraint(equalTo: probabilitiesInput.bottomAnchor, constant: 20).isActive = true
    }
    
    func addObserversForKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func showMatrixInput(_ params: ([Double], Double)) {
        let vc = InputMatrixViewController(
            rowCount: matrixSizePicker.selectedRow(inComponent: 0) ,
            columnCount: matrixSizePicker.selectedRow(inComponent: 1),
            isWinning: isWinningMatrixChecker.isOn,
            alpha: params.1,
            chances: params.0
        )
        vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func checkIsChancesCorrect() -> Bool {
        var sumChance = 0.0
        
        for chanceLabel in probabilitiesInput.stackView.arrangedSubviews {
            guard let chanceNumber = (chanceLabel as! UITextField).text else { return false }
            if
                chanceNumber == "" ||
                Double(chanceNumber) == nil ||
                Double(chanceNumber)! < 0 ||
                Double(chanceNumber)! > 1
            {
                return false
            } else {
                sumChance += Double(chanceNumber)!
            }
        }
        
        if sumChance == 1 {
            return true
        } else {
            return false
        }
    }
    
    func checkIsAlphaCorrect() -> Bool {
        guard let alphaNumber = alphaInput.text else { return false }
        if
            alphaNumber == "" ||
            Double(alphaNumber) == nil ||
            Double(alphaNumber)! < 0 ||
            Double(alphaNumber)! > 1
        {
            return false
        } else {
            return true
        }
    }
    
    func processParameters() -> ([Double], Double) {
        var chances: [Double] = []
        
        for chanceLabel in probabilitiesInput.stackView.arrangedSubviews {
            guard let chanceNumber = (chanceLabel as! UITextField).text else { return  ([], 0) }
            chances.append(Double(chanceNumber)!)
        }
        
        return (chances, Double(alphaInput.text!)!)
    }
}

// MARK: - UIPicker Extension

extension ParamsInputViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(row + 1)"
        } else {
            return "\(row + 1)"
        }
    }
}

