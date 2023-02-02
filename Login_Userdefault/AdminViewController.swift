//
//  AdminViewController.swift
//  Login_Userdefault
//
//  Created by Akshay Yendhe on 02/02/23.
//

import UIKit

class AdminViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    let functionObj = FunctionCollection()
    var userDefaultDictKeys = UserDefaults().dictionaryRepresentation().keys
    var emails = [String]()
    //var range = userDefaultDictKeys.count

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userDefaultDictKeys)
        
        for key in userDefaultDictKeys {
            if functionObj.isValidEmail(email: key) == true {
                emails.append(key)
            }
        }
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = emails[indexPath.row]
        return cell
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        vc.emailId = emails[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
