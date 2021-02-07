//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Александр on 02.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Private Properties
    let user = User.getInfo()
  
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarVC = segue.destination as! UITabBarController
        
        if let viewControllers = tabBarVC.viewControllers {
            for viewController in viewControllers {
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.login = user.person.name
                }
                if let pictureVC = viewController as? PictureViewController {
                    pictureVC.textUnderPhoto = user.person.name + " " + user.person.surname
                }
                if let aboutMeVC = viewController as? AboutMeViewController {
                    aboutMeVC.bigText = user.person.surname + user.person.name +
                        " " + " " + user.person.patronymic
                }
            }
        }
    }
        //MARK: - IB Actions
    @IBAction func logInButtonPressed() {
        if userNameTextField.text == user.userName &&
            passwordTextField.text == user.password {
            performSegue(withIdentifier: "logInSegue", sender: nil)
        } else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField)
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(title: "Oops!", message: "Your name is \(user.userName)😏")
    }
    
    @IBAction func forgotPassButtonPressed() {
        showAlert(title: "Oops!", message: "Your password is \(user.password )😏")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}
// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(
        title: String,
        message: String,
        textField: UITextField? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

    // MARK: - Work with keyboard
    extension LoginViewController: UITextFieldDelegate {
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == userNameTextField {
                passwordTextField.becomeFirstResponder()
            } else {
                logInButtonPressed()
            }
            return true
        }
    }

