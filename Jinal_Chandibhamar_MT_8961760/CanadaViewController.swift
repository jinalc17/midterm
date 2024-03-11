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
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
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
        guard let text = cityTextField.text, !text.isEmpty else {
            return // Do nothing if the text field is empty
        }
        
        let lowercaseText = text.lowercased()
        if cityImages.contains(lowercaseText) {
            setImage(named: lowercaseText)
            errorMessageLabel.isHidden = true
        } else {
            // Display error message and set image to default
            setImage(named: "Canada")
            errorMessageLabel.isHidden = false
            errorMessageLabel.text = "City not found"
        }
    }
    
    // Set image to the image view
    func setImage(named imageName: String) {
        if let image = UIImage(named: imageName + ".jpeg") {
            imageView.image = image
        }
    }
    
}
