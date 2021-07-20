//
//  RegistrationViewController.swift
//  MilkyWay
//
//  Created by Khamitov Darkhan on 7/20/21.
//

import UIKit
import FirebaseAuth


class RegistrationViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func displayAlert(with title: String, and text: String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        guard let email = loginTextField.text,
              let password = passwordTextField.text,
              email != "",
              password != ""
        
        else{
            displayAlert(with: "Incorrect password or email", and: "Fill all fields")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] (result, error) in
            if (error != nil){
                self?.displayAlert(with: "Error", and: error!.localizedDescription)
            }
            else{
                self?.performSegue(withIdentifier: "mainVCSegue", sender: nil)
            }
        }
    }
}

