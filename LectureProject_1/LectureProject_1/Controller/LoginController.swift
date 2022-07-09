//
//  LoginController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 02.07.22.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var dummyView: UIView!
    
    @IBOutlet weak var emailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordCenterConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var dummyViewWidthConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        uiSetup()
        animate()
        basicCornerAnimation()
        basicRotationAnimation()
        transformAnimation()
    }
    
    func animate() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            self.actionButton.alpha = 1
            self.emailCenterConstraint.constant = 0
            self.passwordCenterConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(CountryListController.self)") as! CountryListController
        navigationController?.show(controller, sender: nil)
    }
}

extension LoginController {
    func uiSetup() {
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.red.cgColor
        emailView.layer.cornerRadius = 10
        
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.red.cgColor
        passwordView.layer.cornerRadius = 10
    }
}
