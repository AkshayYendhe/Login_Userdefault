//
//  SignUpViewController.swift
//  Login_Userdefault
//
//  Created by Akshay Yendhe on 17/01/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    
    let functionObj = FunctionCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveData(){
        
        if let fname = fullNameTextField.text, let phoneNumber = phoneNumberTextField.text, let phone = Int(phoneNumber), let emailAddress = emailAddressTextField.text, let pass = passwordTextField.text{
            if functionObj.isValidEmail(email: emailAddress) == true && functionObj.isValidPassword(testStr: pass){
                let newUser = newUser(fullName: fname, phoneNumber: phone, emailAddress: emailAddress, passWord: pass)
                
                userArray = ["\(newUser.fullName)","\(newUser.phoneNumber)","\(newUser.emailAddress)","\(newUser.passWord)"]
                
                // UserDefaults.standard.set(pass, forKey: emailAddress)
                UserDefaults().set(userArray, forKey: emailAddress)
                functionObj.showAlert(vc: self, title: "Saving", message: "Account has been created!",handler: moveToNextVC)
            }
            else{
                functionObj.showAlert(vc: self, title: "Correction?", message: "Please Enter Email = xyz@gmail.com and Password = Xyz@123 In Given Format.")
            }
        }
    }
    
    @IBAction func createAccountButtonAction(_ sender: Any) {
        
        saveData()
        
    }
        func moveToNextVC(alert : UIAlertAction!) {
            let main = UIStoryboard(name: "Main", bundle: .main)
            let vc = main.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    
}
