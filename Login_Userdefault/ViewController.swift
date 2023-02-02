//
//  ViewController.swift
//  Login_Userdefault
//
//  Created by Akshay Yendhe on 17/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Swift.print(FileManager.default.temporaryDirectory)
        //print(UserDefaults.standard.dictionaryRepresentation().keys)

    }

    @IBAction func logInButtonAction(_ sender: Any) {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

