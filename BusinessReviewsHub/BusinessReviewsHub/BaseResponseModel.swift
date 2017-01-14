//
//  BaseResponseModel.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 31/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import Foundation
import EVReflection
import Alamofire

public class BaseResponseModel : EVObject
{
    var errorCode : Int32 = 0
    var message : String = ""
    var data : String = ""
    

}
