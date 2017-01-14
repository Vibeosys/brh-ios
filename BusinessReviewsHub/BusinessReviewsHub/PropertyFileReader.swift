//
//  PropertyFileReader.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 03/01/17.
//  Copyright © 2017 BusinessReviewsHub. All rights reserved.
//

import Foundation


public class PropertyFileReader {
    
   public class func getBaseUrl() -> String
    {
        let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BaseUrl")
        
        return baseUrl as! String
    
    }


}
