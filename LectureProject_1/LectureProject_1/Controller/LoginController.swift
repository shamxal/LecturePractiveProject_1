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
        basicRotateAnimation()
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
    
    func basicCornerAnimation() {
        let animation = CABasicAnimation(keyPath: "cornerRadius") //#keyPath(CALayer.cornerRadius)
        animation.fromValue = 0
        animation.toValue = 60
        animation.duration = 3
        animation.autoreverses = true
        animation.repeatCount = .infinity
        logoImage.layer.add(animation, forKey: nil)
    }
    
    func basicRotateAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z") //#keyPath(CALayer.cornerRadius)
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.duration = 3
        animation.autoreverses = true
        animation.repeatCount = .infinity
//        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        logoImage.layer.add(animation, forKey: nil)
    }
    
    func transformAnimation() {
        UIView.animate(withDuration: 2, delay: 0, options: [.autoreverse, .repeat]) {
            self.dummyView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn") //FLAG
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(CountryListController.self)") as! CountryListController
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.modalPresentationStyle = .overFullScreen
        present(navigationController, animated: true, completion: nil)
//        navigationController?.show(controller, sender: nil)
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
