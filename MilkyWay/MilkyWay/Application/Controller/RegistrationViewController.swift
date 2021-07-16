//
//  RegistrationViewController.swift
//  MilkyWay
//
//  Created by Khamitov Darkhan on 7/16/21.
//

import UIKit
import Firebase


class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func kbDidShow(notification: Notification){
        guard let userInfo = notification.userInfo else {return}
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
        
        (self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
    }
    
    @objc func kbDidHide(notification: Notification){
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              email != "",
              password != ""
        
        else{
            displayAlert(with: "Incorrect password or email", and: "Please check your email and password")
            return
        }
        
        auth
        
    }
    func displayAlert(with title: String, and text: String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func goToRegisterPressed(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
