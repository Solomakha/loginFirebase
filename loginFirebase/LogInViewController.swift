//
//  LogInViewController.swift
//  loginFirebase
//
//  Created by Admin on 09.07.2022.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var createAccauntButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func login(_ sender: Any) {
        validateFields()
    }
    
    @IBAction func createAccaunt(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func validateFields(){
        if emailTextField.text?.isEmpty == true {
            print("No text in emailfield")
            return
        }
        if passwordTextField.text?.isEmpty == true {
            print("No text in passwordfield")
            return
        }
        logIn()
    }
    
    func logIn(){
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!)
        {
            [weak self] authResult, error in
            guard let strongSelf = self
            else
            {
                return
            }
            
            if let error = error {
                print(error.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil{
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainScreen")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
}
