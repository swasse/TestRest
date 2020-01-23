//
//  LoginViewController.swift
//  TestRest
//
//  Created by ontlener on 23/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var rememberSwi: UISwitch!
    let settings = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if settings.bool(forKey: "pref_credentials") {
            userTF.text = settings.string(forKey: "pref_username")
            passwordTF.text = settings.string(forKey: "pref_password")
            rememberSwi.isOn = true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if rememberSwi.isOn{
            settings.set(rememberSwi.isOn, forKey: "pref_credentials")
            settings.set(userTF.text, forKey: "pref_username")
            settings.set(passwordTF.text, forKey: "pref_password")
        }else{
            settings.set(rememberSwi.isOn, forKey: "pref_credentials")
        }
        
    }
}
