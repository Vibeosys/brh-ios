//
//  SendSmsViewController.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 30/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import UIKit

class SendSmsViewController: UIViewController {
    
    
    @IBOutlet weak var companyName: UILabel!
    
    
    @IBOutlet weak var companyLogo: UIImageView!
    

    @IBOutlet weak var custNameTxtFIeld: UITextField!
    
    
    @IBOutlet weak var phoneTxtField: UITextField!
    
    
    @IBAction func sendSmsButton(_ sender: UIButton) {
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        var frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        var imageSize = CGSize.init(width: 20, height: 20)

        
        custNameTxtFIeld.underlined()
        let personImage = UIImage(named:"person")
        custNameTxtFIeld.addLeftIcon(personImage, frame: frame, imageSize: imageSize)
        
        phoneTxtField.underlined()
        let phoneImage = UIImage(named: "phone")
        phoneTxtField.addLeftIcon(phoneImage, frame: frame, imageSize: imageSize)
        

        
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
