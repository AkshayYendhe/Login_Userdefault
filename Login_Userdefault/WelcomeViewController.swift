//
//  WelcomeViewController.swift
//  Login_Userdefault
//
//  Created by Akshay Yendhe on 25/01/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var tempArray = [String]()
    
    @IBOutlet weak var fullNameTextLabel: UILabel!
    
    @IBOutlet weak var mobileNoTextLabel: UILabel!
    
    @IBOutlet weak var emailIdTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameTextLabel.text = "Full Name :- \(tempArray[0])"
        mobileNoTextLabel.text = "Contact Number :- +91\(tempArray[1])"
        emailIdTextLabel.text  = "Email :- \(tempArray[2])"
        
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        vc.emailId = tempArray[2]
        self.present(vc, animated: true)
        
    }
    
}
