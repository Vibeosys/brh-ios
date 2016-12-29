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
        
        
        
//        userTextField.leftViewMode = UITextFieldViewMode.always
//
//        let personimageView = UIImageView(frame: CGRect.init(x:0, y: 0, width: 20, height: 20))
//
//        let personimage = UIImage(named: "ic_person_grey_24.png")
//        personimageView.image = personimage
//        userTextField.leftView = personimageView
//        let userborder = CALayer()
//        let  userwidth = CGFloat(1.0)
//        userborder.borderColor = UIColor.darkGray.cgColor
//        userborder.frame = CGRect(x: 0, y: userTextField.frame.size.height - userwidth, width:  userTextField.frame.size.width, height: userTextField.frame.size.height)
//        
//        userborder.borderWidth = userwidth
//        userTextField.layer.addSublayer(userborder)
//        userTextField.layer.masksToBounds = true
//        
//        
//
        
        
        loginImage.layer.borderWidth = 2
        loginImage.layer.masksToBounds = false
        loginImage.layer.borderColor = UIColor.white.cgColor
        loginImage.layer.cornerRadius = loginImage.frame.height/2
        loginImage.clipsToBounds = true
        
        
        

      var frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
      var imageSize = CGSize.init(width: 20, height: 20)
       
        let personimage = UIImage(named: "ic_person_grey_24.png")
        userTextField.addLeftIcon(personimage, frame:frame, imageSize:imageSize)
         userTextField.underlined()
        
        
        let passwordimage = UIImage(named: "ic_lock_grey_24.png")
        passwordTextField.addLeftIcon(passwordimage, frame: frame, imageSize: imageSize)
        passwordTextField.underlined()

        
        
        
        let companyimage = UIImage(named: "ic_company_grey_24.png")
        companytextField.addLeftIcon(companyimage, frame: frame, imageSize: imageSize)
        companytextField.underlined()

       
        
        
       


        
        
        
        
        
    
        
        
        
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

