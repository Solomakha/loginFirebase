//
//  SignUpViewController.swift
//  loginFirebase
//
//  Created by Admin on 09.07.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var haveAccauntButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func haveAccaunt(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @IBAction func signUpPress(_ sender: Any) {
        if emailText.text?.isEmpty == true {
            print("No text in emailfield")
            return
        }
        if passwordText.text?.isEmpty == true {
            print("No text in passwordfield")
            return
        }
        signUp()
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!)
        {
            (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainScreen")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
}
