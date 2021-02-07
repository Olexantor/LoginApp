//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Александр on 08.02.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var bigTextLabel: UILabel!
    
    var bigText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigTextLabel.text = """
            Меня зовут \(bigText). Я родился в 1991 году в небольшом городе
        Серове. В 20 лет, после службы в армии поступил в УрФУ и переехал в
        Екатеринубрг, да так и остался здесь жить. Пару лет назад женился, и
        даже не по залету, а по любви:)) С год назад мы с женой взяли
        из приюта кота, назвали Тишкой за спокойный нрав и ласковость.
        """
    }
}
