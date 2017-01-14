//
//  SendSmsViewController.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 30/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import UIKit
import Alamofire
import EVReflection
import AlamofireImage
import MBProgressHUD

class SendSmsViewController: UIViewController,UITextFieldDelegate
{
    var userDefaultManager : UserdefaultManager = UserdefaultManager()

    
    @IBOutlet weak var companyName: UILabel!
    
    
    @IBOutlet weak var companyLogo: UIImageView!
    

    @IBOutlet weak var custNameTxtFIeld: UITextField!
    
    
    @IBOutlet weak var phoneTxtField: UITextField!
    
    
    @IBAction func sendSmsButton(_ sender: UIButton)
    {
        
        let checkOut : Bool = validateDataSendSms()
       // let validatePhoneNo : Bool =
        
        if(!checkOut)
        {
            return;
        }
        if((phoneTxtField.text?.characters.count)! < 10)
        {
            self.showAlertMessage(title: "Alert", message: "Phone number is invalid")
            return
        }

        let sendsmsDataRequest : SendSmsDataRequestModel = SendSmsDataRequestModel()
        let sendsmsUserRequest : UserRequestModel? = self.userDefaultManager.getuserDetail()
        
        sendsmsDataRequest.customerName = custNameTxtFIeld.text!
        sendsmsDataRequest.phoneNo = phoneTxtField.text!
        
        showActivity()
        let serviceFacade = ServiceFacade(configUrl:PropertyFileReader.getBaseUrl() )
        serviceFacade.SendSms(sendsmsDataRequest: sendsmsDataRequest,
                              sendsmsUserRequest: sendsmsUserRequest,
                              completionHandler: {
                                response in
                                self.hideActivity()
                                if (response?.errorCode == 0)
                                {
                                    self.showAlertMessage(title: "Success", message: (response?.message)!)
                                    
                                    self.custNameTxtFIeld.text = ""
                                    self.phoneTxtField.text = ""
                                }
                                else
                                {
                                    self.showAlertMessage(title: "INFO", message: "Try Again")
                                }
                                
        
        
        
        })
        
        
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        self.custNameTxtFIeld.text = ""
        self.phoneTxtField.text = ""

        
    }
    
    
    @IBOutlet weak var submessageView: UIView!
    
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        self.custNameTxtFIeld.delegate = self
        self.phoneTxtField.delegate = self
        
       
            submessageView.layer.borderColor = UIColor.lightGray.cgColor
            submessageView.layer.borderWidth = 0.5
            
            
            let frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
            let imageSize = CGSize.init(width: 20, height: 20)
            
            
            custNameTxtFIeld.underlined()
            let personImage = UIImage(named:"person")
            custNameTxtFIeld.addLeftIcon(personImage, frame: frame, imageSize: imageSize)
            
            phoneTxtField.underlined()
            let phoneImage = UIImage(named: "phone")
            phoneTxtField.addLeftIcon(phoneImage, frame: frame, imageSize: imageSize)
        
//        let phoneNumber = self.phoneTxtField.text!
//        var phoneNumbermask = phoneNumber.toPhoneNumber()
        
            
            companyName.text = userDefaultManager.getCompanyName()
        
        if (userDefaultManager.getCompanyLogo()==nil)
        {
        }
        else
        {
            let url = URL(string:userDefaultManager.getCompanyLogo()!)
            if(url == nil){}
            else
            {
            let data = NSData(contentsOf:url!)
            self.companyLogo.image = UIImage(data:data as! Data)
            }
        }
        
        
        

        
        
        
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    func validateDataSendSms()-> Bool
    {
        if (custNameTxtFIeld.text?.isEmpty)!
        {
        self.showAlertMessage(title: "INFO", message: "Please Enter Customer Name")
            return false
        }
    else if (phoneTxtField.text?.isEmpty)!
        {
            self.showAlertMessage(title: "INFO", message: "Please Enter Phone Number")
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
        if(textField == custNameTxtFIeld)
        {
            custNameTxtFIeld.resignFirstResponder()
            phoneTxtField.becomeFirstResponder()
        }
        else if(textField == phoneTxtField)
        {
            self.view.endEditing(true)
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let charsLimit = 10
        
        let startingLength = phoneTxtField.text?.characters.count ?? 0
        let lengthToAdd = string.characters.count
        let lengthToReplace =  range.length
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        return newLength <= charsLimit
    }

}
