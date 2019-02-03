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
        
        view.addSubview(variableA)
        view.addSubview(variableB)
        view.addSubview(variableATextField)
        view.addSubview(variableBTextField)
        view.addSubview(resultLabel)
        view.addSubview(calcualteButton)
        
        variableAConstraints()
        variableBConstrants()
        variableAtextFieldConstraint()
        variableBtextFieldConstraint()
        resultsLabelContrastraints()
        fireButtonConstraints()
        
        variableATextField.layer.cornerRadius = 4.8
        variableBTextField.layer.cornerRadius = 4.0
        
        view.backgroundColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.calcualteButton.center.y += 30
        self.calcualteButton.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            self.calcualteButton.center.y -= 30
            self.calcualteButton.alpha = 1.0
        }, completion: nil)
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
    lazy var calcualteButton: UIButton = {
        let calculateImage = UIImage(named: "System-Calc-icon")
        let button = UIButton()
        button.setImage(calculateImage, for: .normal)
        button.addTarget(self, action: #selector(calulatorButtonTapped(_:)), for: .touchUpInside)
        
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
    
    // Variable B
    func variableBConstrants() {
        variableB.translatesAutoresizingMaskIntoConstraints = false
        variableB.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        variableB.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        variableA.layer.cornerRadius = 9
    }
    
    // Variable A
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
            resultLabel.topAnchor.constraint(equalTo: variableBTextField.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: variableBTextField.leadingAnchor, constant: 0)
            ])
    }
    
    func fireButtonConstraints() {
        calcualteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calcualteButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50),
            calcualteButton.leadingAnchor.constraint(equalTo: resultLabel.leadingAnchor, constant: 0)
            ])
    }
    
    func addPulse() {
        let pulse = Pulsing(numberOfPulses: 1, radius: 250, position: calcualteButton.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.yellow.cgColor
        
        self.view.layer.insertSublayer(pulse, below: calcualteButton.layer)
    }
    
    @objc private func calulatorButtonTapped(_ sender: UIButton?) {
        addPulse()
        guard let a = Int(variableATextField.text!) else { return }
        guard let b = Int(variableBTextField.text!) else { return }
        let answer = CalculatorController.shared.greatestCommonD(a, b)
        resultLabel.text = String(answer)
    } 
}
