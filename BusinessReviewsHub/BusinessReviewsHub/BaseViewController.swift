//
//  BaseViewController.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 02/01/17.
//  Copyright © 2017 BusinessReviewsHub. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}


extension UIViewController
{
    
    func showAlertMessage(title: String, message : String)
    {
        let alertView = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            
            print("showAlert")
        }
        let defaultAction = UIAlertAction.init(title: "OK", style: .default, handler: callActionHandler)
        alertView.addAction(defaultAction)
        alertView.modalPresentationStyle = UIModalPresentationStyle.currentContext
        self.present(alertView, animated: true)
        
    
    }
    
    
}

