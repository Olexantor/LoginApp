//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Александр on 03.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingsLabel: UILabel!
    
    var login: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingsLabel.text = "Welcome, \(login ?? "Random name")!"
    }
    
    @IBAction func logOutButtonTapped() {
    }
   
}
