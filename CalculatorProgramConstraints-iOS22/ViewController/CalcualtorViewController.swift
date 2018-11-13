//
//  CalcualtorViewController.swift
//  CalculatorProgramConstraints-iOS22
//
//  Created by Ivan Ramirez on 11/12/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class CalcualtorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Heading
        self.title = "Greatest Common Denominator \niOS22"
        
        view.addSubview(variableA)
        view.addSubview(variableB)
        view.addSubview(variableATextField)
        view.addSubview(variableBTextField)
        view.addSubview(resultLabel)
        view.addSubview(calcualteBUtton)
        //view.backgroundColor = .clear
        
        //buttonConstraints()
        variableAConstraints()
        variableBConstrants()
        variableAtextFieldConstraint()
        variableBtextFieldConstraint()
        resultsLabelContrastraints()
        fireButtonConstraints()
        calculateButtonTapped()
    }
    
    
    
    // MARK: - Variable A Label
    var variableA: UILabel = {
        let label = UILabel()
        label.text = "Variable A"
        label.textColor = UIColor(displayP3Red: 55/255, green: 215/255, blue: 239/255, alpha: 1.0)
        label.font = UIFont(name: "Optima-BoldItalic", size: 20)
        // UI
        label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.shadowRadius = 10.0
        label.layer.shadowOpacity = 0.8
        
        return label
    }()
    
    // MARK: - Variable B Label
    var variableB: UILabel = {
        let label = UILabel()
        label.text = "Variable B"
        label.textColor = UIColor(displayP3Red: 55/255, green: 215/255, blue: 239/255, alpha: 1.0)
        label.font = UIFont(name: "Optima-BoldItalic", size: 20)
        // UI
        label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.shadowRadius = 10.0
        label.layer.shadowOpacity = 0.8
        
        return label
    }()
    
    
    // MARK: - Calculate Button
    let calcualteBUtton: UIButton = {
        
        let calculateImage = UIImage(named: "System-Calc-icon")
        
        let button = UIButton(type: .system)
        
        button.setImage(calculateImage, for: .normal)
        
        return button
    }()
    
    // MARK: - Variable A TextField
    var variableATextField: UITextField = {
        
        let someFrame = CGRect(x: 0, y: 0, width: 100.0, height: 30.0)
        
        let textLabel = UITextField(frame: someFrame)
        textLabel.placeholder = "Enter Number"
        textLabel.backgroundColor = .purple
        return textLabel
    }()
    
    // MARK: - Variable B TextField
    var variableBTextField: UITextField = {
        
        let someFrame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0)
        
        let textLabel = UITextField(frame: someFrame)
        textLabel.placeholder = "Enter Number"
        textLabel.backgroundColor = .purple
        return textLabel
    }()
    
    // MARK: - Results Label
    var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Results"
        label.textColor = UIColor(displayP3Red: 55/255, green: 215/255, blue: 239/255, alpha: 1.0)
        label.font = UIFont(name: "Optima-BoldItalic", size: 20)
        
        // UI
        label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.shadowRadius = 10.0
        label.layer.shadowOpacity = 0.8
        
        return label
    }()
    
    // Variable A
    func variableAConstraints() {
        variableA.translatesAutoresizingMaskIntoConstraints = false
        
        variableA.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        variableA.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        
        variableA.layer.cornerRadius = 9
    }
    
    func variableBConstrants() {
        variableB.translatesAutoresizingMaskIntoConstraints = false
        
        variableB.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        variableB.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        
        variableA.layer.cornerRadius = 9
        
    }
    
    func variableAtextFieldConstraint() {
        variableATextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            variableATextField.leadingAnchor.constraint(equalTo: variableA.leadingAnchor, constant: 100),
            variableATextField.centerYAnchor.constraint(equalTo: variableA.centerYAnchor, constant: 0)
            
            ])
    }
    
    // MARK: - Variable B TextField Constraints
    func variableBtextFieldConstraint() {
        variableBTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            variableBTextField.leadingAnchor.constraint(equalTo: variableB.leadingAnchor, constant: 100),
            variableBTextField.centerYAnchor.constraint(equalTo: variableB.centerYAnchor, constant: 0)
            
            ])
    }
    
    func resultsLabelContrastraints() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: variableBTextField.bottomAnchor, constant: 5),
            
            resultLabel.leadingAnchor.constraint(equalTo: variableBTextField.leadingAnchor, constant: 0)
            
            ])
    }
    
    func fireButtonConstraints() {
        calcualteBUtton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calcualteBUtton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 5),
            
            calcualteBUtton.leadingAnchor.constraint(equalTo: resultLabel.leadingAnchor, constant: 0)
            ])
    }
    
    private func calculateButtonTapped() {
        let sayButtonT = UIButton(type: .custom)
        sayButtonT.addTarget(self, action: #selector(calculateAction(_:)), for: .touchUpInside)
        print("🚨Button Tapped ")
    }
    
    @objc private func calculateAction(_ sender: UIButton?) {
        let a:Int = Int(variableATextField.text!)!
        let b:Int = Int(variableBTextField.text!)!
        
        
        let answer = CalculatorController.shared.greatestCommonD(a, b)
        
        resultLabel.text = String(answer)
        
        // NOT sure how to reload the UIViewController
        print("🐙 BUtton Tapppped private func")
    } 
}
