//  ViewController.swift
//  cloneVK
//
//  Created by Alexander Kokh on 03.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollViewLogin: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        scrollViewLogin.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillShown(notification: Notification) {
        
        let info  = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
       
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0)
       
        scrollViewLogin.contentInset = contentInsets
        scrollViewLogin.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollViewLogin.contentInset = UIEdgeInsets.zero
        scrollViewLogin.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func hideKeyBoard() {
        scrollViewLogin.endEditing(true)
    }

    private func checkLoginInfo() -> Bool {
        
        guard let logintext = loginTextField.text else { return false}
        guard let passtext = passwordTextField.text else { return false}
        
        if logintext == "admin", passtext == "1234" {
            print("successful authorization")
            return true
        }
        else {
            print("uncorrect password or login, please retry")
            return false
        }
    }
    
    private func showLoginError() {
        let alert = UIAlertController(title: "Autorization Error", message: "Login or Password is not correct", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert,animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSeque" {
            if checkLoginInfo() {
                return true
            }
            else {
                showLoginError()
                return false
            }
        }
        return true
    }
}

