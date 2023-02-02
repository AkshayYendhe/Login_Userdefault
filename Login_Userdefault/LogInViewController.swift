//
//  LogInViewController.swift
//  Login_Userdefault
//
//  Created by Akshay Yendhe on 17/01/23.
//

import UIKit

class LogInViewController: UIViewController {
    
    let functionObj = FunctionCollection()
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        
        
        if emailAddressTextField.text! == "admin@gmail.com" {
            var userArray = UserDefaults().array(forKey: emailAddressTextField.text!)
            let vc = storyboard?.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else{

            var userArray = UserDefaults().array(forKey: emailAddressTextField.text!)
            if let email = emailAddressTextField.text, let password = passwordTextField.text, (!email.isEmpty && !password.isEmpty){
                if let myarray = userArray, !myarray.isEmpty  {
                    let passwordInDefaults = userArray![3] as? String
                    if password == passwordInDefaults {
                        let vc = (storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController")) as! WelcomeViewController
                        vc.tempArray = UserDefaults().array(forKey: email) as? [String] ?? [""]
                        navigationController?.pushViewController(vc, animated: true)
                    }
                    else{
                        functionObj.showAlert(vc: self, title: "Incorrect Password", message: "You Entered Your Correct Password!")
                    }
                }
                else{
                    functionObj.showAlert(vc: self, title: "Please Sign Up!", message: "User not found!")
                }
            }
            else{
                functionObj.showAlert(vc: self, title: "Empty", message: "Please Fill All Fields Are Mandatory")
            }
        }
    }
}
