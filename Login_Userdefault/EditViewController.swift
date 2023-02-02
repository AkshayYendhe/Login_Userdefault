//
//  EditViewController.swift
//  Login_Userdefault
//
//  Created by Akshay Yendhe on 25/01/23.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var editFNameTextField: UITextField!
    
    @IBOutlet weak var editMobileNoTextField: UITextField!
    
    @IBOutlet weak var editEmailIdTextField: UITextField!
    
    var emailId : String = ""
    let functionObj = FunctionCollection()
    
    @IBOutlet weak var editPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveChangesButton(_ sender: Any) {
        UserDefaults().removeObject(forKey: emailId)
        saveData()
    }
    func saveData(){
        
        if let fname = editFNameTextField.text, let phoneNumber = editMobileNoTextField.text, let phone = Int(phoneNumber), let emailAddress = editEmailIdTextField.text, let pass = editPasswordTextField.text{
            if functionObj.isValidEmail(email: emailAddress) == true && functionObj.isValidPassword(testStr: pass){
                let newUser = newUser(fullName: fname, phoneNumber: phone, emailAddress: emailAddress, passWord: pass)
                
                userArray = ["\(newUser.fullName)","\(newUser.phoneNumber)","\(newUser.emailAddress)","\(newUser.passWord)"]
                
                // UserDefaults.standard.set(pass, forKey: emailAddress)
                UserDefaults().set(userArray, forKey: emailAddress)
                functionObj.showAlert(vc: self, title: "Done!", message: "Changes Done!!!")
            }
            else{
                functionObj.showAlert(vc: self, title: "Correction?", message: "Please Enter Email = xyz@gmail.com and Password = Xyz@123 In Given Format.")
            }
        }
    }
}
