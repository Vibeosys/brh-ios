//
//  ServiceFacade.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 31/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection

public class ServiceFacade
{
    var baseUrl : String?
    
    init(configUrl : String?)
    {
        baseUrl = configUrl
    
    }
    
    
    public func Signup(userRegistration : UserRegistrationModel? ,userInfo: UserInfoModel?,completionHandler : @escaping (BaseResponseModel)->Void?)
    {
        var endPointUrl : URL = URL(string:baseUrl! + "/emplogin")!
        var baseResponse : BaseResponseModel = BaseResponseModel()
        var dataRegisterString : String? = userRegistration?.toJsonString()
        var userRegisterString : String? = userInfo?.toJsonString()
        
        var requestRegisterParameter : Parameters = buildRequestParameters(dataString: dataRegisterString, userString: userRegisterString)
        
        Alamofire.request(endPointUrl, method: .post, parameters: requestRegisterParameter, encoding: JSONEncoding.default, headers: nil).responseJSON{
             response in
            guard response.result.isSuccess else{
                return
            }
            guard  let responseRegistrationValue = response.result.value as? [String : AnyObject]
                else{
                    return
            
            }
            var responseRegistrationErrorCode : Int32 = responseRegistrationValue["errorCode"] as! Int32
            print(responseRegistrationErrorCode)
            var responseRegistrationMessage : String = (responseRegistrationValue["message"] as? String)!
            print(responseRegistrationMessage)
            var responseRegistrationData : String = (responseRegistrationValue["data"] as? String)!
            print(responseRegistrationData)
            
            
            
            
            
            
            
            
            
        
        
        
        }
        
        
        
        
        
        
    
    
    
    }
    
    private func buildRequestParameters(dataString:String?, userString: String?) -> Parameters{
        var params: Parameters = Parameters()
        
        params["data"] = dataString as AnyObject?
        params["user"] = userString as AnyObject?
        return params
    }




}
