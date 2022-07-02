//
//  LoginController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 02.07.22.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiSetup()
    }
    
}

extension LoginController {
    func uiSetup() {
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.red.cgColor
        emailView.layer.cornerRadius = 10
    }
}
