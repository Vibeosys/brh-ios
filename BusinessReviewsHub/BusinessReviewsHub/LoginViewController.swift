//
//  ViewController.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 27/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var loginImage: UIImageView!
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var userTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var companytextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        self.loginImage.layer.cornerRadius = self.loginImage.frame.size.height
//        loginImage.clipsToBounds = true
//        loginImage.layer.borderColor = UIColor.white.cgColor
//        loginImage.layer.borderWidth = 1.0
//        loginImage.layer.masksToBounds = true
//        var paddingLeft: CGFloat = 5
//        var paddingRight: CGFloat = 5
        
        
        userTextField.leftViewMode = UITextFieldViewMode.always

        let personimageView = UIImageView(frame: CGRect.init(x:0, y: 0, width: 20, height: 20))

        let personimage = UIImage(named: "ic_person_grey_24.png")
        personimageView.image = personimage
        userTextField.leftView = personimageView
    
        
        
        
        
                
        
        
        companytextField.leftViewMode = UITextFieldViewMode.always
        let companyimageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        let companyimage = UIImage(named: "ic_company_grey_24.png")
        companyimageView.image = companyimage
        companytextField.leftView = companyimageView
        
      //  companytextField.leftView = UIView(frame:CGRect(0,0,30,30))
        
        
        passwordTextField.leftViewMode = UITextFieldViewMode.always
        let passwordimageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let passwordimage = UIImage(named: "ic_lock_grey_24.png")
        passwordimageView.image = passwordimage
        passwordTextField.leftView = passwordimageView
        



        
        
        
        
        
    
        
        
        
    }
    
//    func setRounded() {
//        let radius = self.frame.width / 2
//        self.layer.cornerRadius = radius
//        self.layer.masksToBounds = true
//        self.clipsToBounds = true;
//        self.layer.borderWidth = 0.0;
//        self.layer.borderColor = UIColor.white.cgColor
//        
//        
//    }
//

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

