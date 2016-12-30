//
//  ProfileViewController.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 30/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{

    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var nameTxtField: UITextField!
    
    
    @IBOutlet weak var phoneTxtField: UITextField!
    
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    
    @IBAction func saveProfileButton(_ sender: Any) {
    }
    
    
    @IBAction func logoutProfileButton(_ sender: UIButton) {
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
        
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        

       
        
        nameTxtField.underlined()
        passwordTxtField.underlined()
        phoneTxtField.underlined()
        
        var frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        var imageSize = CGSize.init(width: 20, height: 20)
        
        let pencileditImage = UIImage(named:"penciledit")
        nameTxtField.addRightIcon(pencileditImage, frame: frame, imageSize: imageSize)
         passwordTxtField.addRightIcon(pencileditImage, frame: frame, imageSize: imageSize)
         phoneTxtField.addRightIcon(pencileditImage, frame: frame, imageSize: imageSize)
        
        

        
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
