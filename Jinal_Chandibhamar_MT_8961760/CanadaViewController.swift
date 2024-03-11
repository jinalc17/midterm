//
//  CanadaViewController.swift
//  Jinal_Chandibhamar_MT_8961760
//
//  Created by user239775 on 3/10/24.
//

import UIKit

class CanadaViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    
    @IBOutlet weak var findButton: UIButton!
    
    let cityImages = ["winnipeg", "vancouver", "toronto", "montreal", "halifax", "calgary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        setImage(named: "Canada") // Set default image when the view is loaded
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Set image to default "Canada" when the user navigates back to this page
        setImage(named: "Canada")
        cityTextField.text = ""
    }
    
    // Lock orientation to portrait
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func findButtonTapped(_ sender: UIButton) {
        findCity()
    }
    
    func findCity() {
        let text = cityTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if text.isEmpty {
            // If text field is empty, set image to default "Canada"
            setImage(named: "Canada")
            errorMessageLabel.isHidden = true // Hide error message
        } else {
            // Check if the entered city name matches any of the image names in the array
            let lowercaseText = text.lowercased()
            if cityImages.contains(lowercaseText) {
                setImage(named: lowercaseText)
                errorMessageLabel.isHidden = true
            } else {
                // Display error message and set image to default "Canada"
                setImage(named: "Canada")
                errorMessageLabel.isHidden = false
                errorMessageLabel.text = "City not found"
            }
        }
        
    }
    
    // Set image to the image view
    func setImage(named imageName: String) {
        if let image = UIImage(named: imageName + ".jpeg") {
            imageView.image = image
        }
    }
    
}
