//
//  ProfileViewController.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 30/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import UIKit
import MBProgressHUD

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate
{
    var userDefaultManager : UserdefaultManager = UserdefaultManager()
    let imagePickerController = UIImagePickerController()
    

    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var nameTxtField: UITextField!
    
    
    @IBOutlet weak var phoneTxtField: UITextField!
    
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    
    @IBAction func saveProfileButton(_ sender: Any)
    {
        let image : UIImage = profileImage.image!
        let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
        let strBase64:String = imageData.base64EncodedString(options:.lineLength64Characters)
        
        if((phoneTxtField.text?.characters.count)! < 10)
        {
            self.showAlertMessage(title: "Alert", message: "Phone number is invalid")
            return
        }

        
        
        showActivity()
        
        let profileUpdateData : ProfileDataRequestModel = userDefaultManager.getDataDetail()
        profileUpdateData.profileImage = strBase64
        let profileUpdateUser : UserRequestModel? = userDefaultManager.getuserDetail()
        
        let servicefacade = ServiceFacade(configUrl: PropertyFileReader.getBaseUrl())
        servicefacade.ProfileUpdate(profileDataRequest: profileUpdateData,
                                    profileUserRequest: profileUpdateUser,
                                    completionHandler: {
                                        response in
                                        self.hideActivity()
                                        self.userDefaultManager.getupdateData(name:self.nameTxtField.text!, profileImage: (response?.profileImageUrl)!, phoneNo: self.phoneTxtField.text!, password: self.passwordTxtField.text!)
                                        self.showAlertMessage(title: "User Profile", message:"Profile Update Succesfully")
        
                })
    }
    
    
    @IBAction func logoutProfileButton(_ sender: UIButton)
    {
//        showActivity()
        self.userDefaultManager.getUserdefaultClear()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        hideActivity()
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as UIViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.nameTxtField.delegate = self
        self.phoneTxtField.delegate = self
        self.passwordTxtField.delegate = self
        
        
        
        
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
        nameTxtField.underlined()
        passwordTxtField.underlined()
        phoneTxtField.underlined()
        
        let frame = CGRect.init(x: 0, y: 0 , width: 30, height: 30)
        let imageSize = CGSize.init(width: 20, height: 20)
        
        let pencileditImage = UIImage(named:"penciledit")
        nameTxtField.addRightIcon(pencileditImage, frame: frame, imageSize: imageSize)
         passwordTxtField.addRightIcon(pencileditImage, frame: frame, imageSize: imageSize)
         phoneTxtField.addRightIcon(pencileditImage, frame: frame, imageSize: imageSize)
        
        
        self.nameTxtField.text = userDefaultManager.getName()
        self.passwordTxtField.text = userDefaultManager.getPassword()
        self.phoneTxtField.text = userDefaultManager.getPhoneNo()
        
        if (userDefaultManager.getProfileImage()==nil)
        {}
        else{
            let url = URL(string:userDefaultManager.getProfileImage()!)
            if(url == nil)
            {}
            else
            {
            let data = NSData(contentsOf:url!)
            profileImage.image = UIImage(data:data! as Data)
            }
        
        }
        
        
        imagePickerController.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.tappedMe))
        profileImage.addGestureRecognizer(tap)
        profileImage.isUserInteractionEnabled = true
       
        
        
    
    }
    
    
//    override func viewDidLayoutSubviews()
//    {
//        profileImage.layer.borderWidth = 1
//        profileImage.layer.masksToBounds = false
//        profileImage.layer.borderColor = UIColor.black.cgColor
//        profileImage.layer.cornerRadius = profileImage.frame.height/2
//        profileImage.clipsToBounds = true
//        
//        nameTxtField.underlined()
//        passwordTxtField.underlined()
//        phoneTxtField.underlined()
//    }
    
    
    func tappedMe()
    {
        
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePickerController.allowsEditing = true
         self.present(imagePickerController,animated: true, completion:nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                        //profileImage.contentMode = .scaleAspectFit
                        profileImage.image = pickedImage
                    }
            
                    dismiss(animated: true, completion: nil)
    

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
        if(textField == nameTxtField)
        {
        nameTxtField.resignFirstResponder()
            phoneTxtField.becomeFirstResponder()
        }
        else if(textField == phoneTxtField)
        {
            phoneTxtField.resignFirstResponder()
            passwordTxtField.becomeFirstResponder()
        }
        else if (textField == passwordTxtField)
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

    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
