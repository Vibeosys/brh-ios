 //
//  ViewController.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 27/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import UIKit
import Alamofire
import EVReflection
import MBProgressHUD


class LoginViewController: UIViewController,UITextFieldDelegate
{
    
    @IBOutlet weak var scrollView: UIScrollView!
    var userDefaultManager : UserdefaultManager = UserdefaultManager()
    
    
    
    @IBOutlet weak var loginImage: UIImageView!
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var userTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var companytextField: UITextField!
    
    
    @IBAction func signInButtonTapped(_ sender: UIButton)
    {
        
        
        
        let checkOut : Bool = validateData()
        
        if(!checkOut)
        {
            return;
        }
        
       
            let userRegistration : UserRegistrationModel = UserRegistrationModel()
            let userInfo :UserInfoModel = UserInfoModel()
//            let empLoginResponse :EmpLoginResponseModel = EmpLoginResponseModel()
        
            userRegistration.email = userTextField.text!
            userRegistration.password = passwordTextField.text!
            userRegistration.companyCode = companytextField.text!
        
            showActivity()
            
            let serviceFacade = ServiceFacade(configUrl :PropertyFileReader.getBaseUrl())
            serviceFacade.EmployeeLogin(userRegistration: userRegistration, userInfo: userInfo,
                                    completionHandler: {
                                        response in
                                        
                                        self.hideActivity()
                                        
                                        if(response?.errorCode == 0)
                                        {                                           
                                            response?.email = self.userTextField.text
                                            response?.password = self.passwordTextField.text
                                            response?.companyCode = self.companytextField.text
                                            self.userDefaultManager.saveUserData(empResponse: response)
                                            
//                                            let sendsmsViewController : SendSmsViewController = SendSmsViewController()
//                                            self.present(sendsmsViewController, animated: true, completion: nil)
                                            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                            let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as UIViewController
                                            self.present(vc, animated: true, completion: nil)
                                        }
                                        else
                                        {
                                        self.showAlertMessage(title: "Authenication Error", message: (response?.message)!)
                                            self.userTextField.text = ""
                                            self.passwordTextField.text = ""
                                            self.companytextField.text = ""
                                        }
                                        
                                        })
            }
    
    
   
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loginImage.layer.borderWidth = 2
        loginImage.layer.masksToBounds = false
        loginImage.layer.borderColor = UIColor.white.cgColor
        loginImage.layer.cornerRadius = loginImage.frame.height/2
        loginImage.clipsToBounds = true
        
        self.userTextField.delegate = self
        self.passwordTextField.delegate = self
        self.companytextField.delegate = self
        
        

      let frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
      let imageSize = CGSize.init(width: 20, height: 20)
       
        
         userTextField.underlined()
        let personimage = UIImage(named:"person")
        userTextField.addLeftIcon(personimage, frame:frame, imageSize:imageSize)
        
        passwordTextField.underlined()
        let passwordimage = UIImage(named: "password")
        passwordTextField.addLeftIcon(passwordimage, frame: frame, imageSize: imageSize)
        passwordTextField.underlined()
        
        companytextField.underlined()
        let companyimage = UIImage(named: "company")
        companytextField.addLeftIcon(companyimage, frame: frame, imageSize: imageSize)
        companytextField.underlined()
        
        
        
}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func validateData() -> Bool
    {
        
        if (self.userTextField.text?.isEmpty)!
        {
            self.showAlertMessage(title: "INFO", message: "Please Enter User Name")
            return false
        }
        else if (self.passwordTextField.text?.isEmpty)!
        {
            self.showAlertMessage(title: "INFO", message: "Please Enter Password")
            return false
        }
        else if (self.companytextField.text?.isEmpty)!
        {
            self.showAlertMessage(title: "INFO", message: "Please Enter Company Code")
            return false
        }
        return true
    
    
    }
    
    func showActivity()
    {
    let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
    }
    
    func hideActivity()
    {
    MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if (textField == userTextField)
        {
        userTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        else if (textField == passwordTextField)
        {
            passwordTextField.resignFirstResponder()
            companytextField.becomeFirstResponder()
        }
        else if (textField == companytextField)
        {
            self.view.endEditing(true)
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
 }



