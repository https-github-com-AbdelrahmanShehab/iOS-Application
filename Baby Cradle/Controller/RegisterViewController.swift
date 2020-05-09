//
//  RegisterViewController.swift
//  Baby Cradle
//
//  Created by Abdelrahman Shehab on 4/26/20.
//  Copyright © 2020 Abdelrahman Shehab. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registerEmailTextField: UITextField!
    @IBOutlet weak var registerPasswordTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!

    // Make New User 
    @IBAction func registerPressedButton(_ sender: UIButton) {

        if let email = registerEmailTextField.text, let password = registerPasswordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    self.alertLabel.text = e.localizedDescription
                }else{
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        registerEmailTextField.endEditing(true)
        registerPasswordTextField.endEditing(true)
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Corner Radius for IBOutlets
        registerView.layer.cornerRadius = 10
        registerButton.layer.cornerRadius = 5

        // Delegation of Text Fields
        registerEmailTextField.delegate = self
        registerPasswordTextField.delegate = self

        //Change the Name of TextField Placeholder
        registerEmailTextField.setPlaceHolder(with: "New E-mail")
        registerPasswordTextField.setPlaceHolder(with: "New Password")

        // Setting The Gradiant Colors for Views
        view.setGradientBackground(colorOne: K.BrandColors.darkPurple, colorTwo: K.BrandColors.turquoise)
        registerView.setTreboGradientBackground(colorOne: K.BrandColors.purple, colorTwo: K.BrandColors.beige, colorThree: K.BrandColors.blue22)
        registerButton.setGradientBackground(colorOne: K.BrandColors.purple22, colorTwo: K.BrandColors.blueGreen)
       
    }
    


}
