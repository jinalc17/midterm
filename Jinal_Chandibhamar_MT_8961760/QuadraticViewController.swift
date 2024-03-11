//
//  QuadraticViewController.swift
//  Jinal_Chandibhamar_MT_8961760
//
//  Created by user239775 on 3/10/24.
//

import UIKit

class QuadraticViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var aTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    @IBOutlet weak var cTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate for text fields
        aTextField.delegate = self
        bTextField.delegate = self
        cTextField.delegate = self
        messageLabel.isHidden = true
        resultLabel.isHidden = true
        // Set keyboard type to decimalPad for numeric input
        aTextField.keyboardType = .decimalPad
        bTextField.keyboardType = .decimalPad
        cTextField.keyboardType = .decimalPad
    }
    
    // Lock orientation to portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let textA = aTextField.text, !textA.isEmpty,
              let textB = bTextField.text, !textB.isEmpty,
              let textC = cTextField.text, !textC.isEmpty,
              let aValue = Double(textA),
              let bValue = Double(textB),
              let cValue = Double(textC) else {
            showMessage("Please enter valid numbers for A, B, and C.")
            return
        }
        
        // Check if input A is zero
        if aValue == 0 {
            showMessage("The value you entered for A is invalid.")
            return
        }
        
        // Check if input B is zero
        if bValue == 0 {
            showMessage("The value you entered for B is invalid.")
            return
        }
        
        // Check if input C is zero
        if cValue == 0 {
            showMessage("The value you entered for C is invalid.")
            return
        }
        
        // Calculate X using the equation
        let discriminant = bValue * bValue - 4 * aValue * cValue
        
        if discriminant < 0 {
            showMessage("There are no results since the discriminant is less than zero.")
            hideResult()
        } else if discriminant == 0 {
            let x = -bValue / (2 * aValue)
            showResult("There is only one value for X: \(x)")
        } else {
            let x1 = (-bValue + sqrt(discriminant)) / (2 * aValue)
            let x2 = (-bValue - sqrt(discriminant)) / (2 * aValue)
            showResult("There are two values for X: \(x1), \(x2)")
        }
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        aTextField.text = ""
        bTextField.text = ""
        cTextField.text = ""
        resultLabel.text = ""
        showMessage("Enter a value for A, B, and C to find X.")
    }
    
    func showMessage(_ message: String) {
        messageLabel.text = message
        messageLabel.isHidden = false
        resultLabel.isHidden = true
    }
    func showResult(_ result: String) {
        resultLabel.text = result
        resultLabel.isHidden = false
        messageLabel.isHidden = true
    }
    
    func hideResult() {
        resultLabel.isHidden = true
    }
    
    // Show and hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
