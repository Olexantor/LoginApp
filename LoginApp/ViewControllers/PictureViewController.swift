//
//  PicturesViewController.swift
//  LoginApp
//
//  Created by Александр on 08.02.2021.
//

import UIKit

class PictureViewController: UIViewController {

    
    @IBOutlet var photoLabel: UILabel!
    
    var textUnderPhoto = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoLabel.text = textUnderPhoto
    }
}
