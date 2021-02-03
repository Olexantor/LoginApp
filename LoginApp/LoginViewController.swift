//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Александр on 02.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let userName = "User"
    let password = "Password"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.login = userNameTextField.text
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTextField.text == userName && passwordTextField.text == password {
            performSegue(withIdentifier: "logInSegue", sender: nil)
        } else {
            showAlertWrongData(with: "Invalid login or password",
                               and: "Please, enter correct login and password")
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlertForgotData(with: "Oops!", and: "Your name is \(userName)😏")
    }
    
    @IBAction func forgotPassButtonPressed() {
        showAlertForgotData(with: "Oops!",
                            and: "Your password is \(password )😏")
    }
}

extension LoginViewController {
    private func showAlertForgotData(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showAlertWrongData(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
