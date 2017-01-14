//
//  UserDefaultManager.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 02/01/17.
//  Copyright © 2017 BusinessReviewsHub. All rights reserved.
//

import Foundation
import EVReflection

public class UserdefaultManager
{
    let userDefaults = UserDefaults.standard
    
    public func saveUserData(empResponse : EmpLoginResponseModel?)
    {
        
        userDefaults.setValue(empResponse?.empCode, forKey: "empCode")
        userDefaults.setValue(empResponse?.empName, forKey: "empName")
        userDefaults.setValue(empResponse?.phoneNo, forKey: "phoneNo")
        userDefaults.setValue(empResponse?.companyName, forKey: "companyName")
        userDefaults.setValue(empResponse?.companyLogo, forKey: "companyLogo")
        userDefaults.setValue(empResponse?.profileImage, forKey: "profileImage")
        userDefaults.setValue(empResponse?.email, forKey: "email")
        userDefaults.setValue(empResponse?.password, forKey: "password")
        userDefaults.setValue(empResponse?.companyCode, forKey: "companyCode")
        userDefaults.synchronize()



    }
    
    public func getuserDetail()-> UserRequestModel
    {
        let userRequest: UserRequestModel = UserRequestModel()
            userRequest.empCode = userDefaults.value(forKeyPath: "empCode") as! String
            userRequest.companyCode = userDefaults.value(forKeyPath: "companyCode") as! String
            userRequest.password = userDefaults.value(forKey: "password") as! String
            return userRequest
    
    }
    
    public func getCompanyName()-> String?
    {
        
         let companyName : String? = userDefaults.value(forKey: "companyName") as? String
            return companyName
    }
    
    public func getCompanyLogo()-> String?
    {
        let companyLogo : String? = userDefaults.value(forKey: "companyLogo") as? String
        return companyLogo
    }
    
    public func getName()-> String?
    {
        let empName : String? = userDefaults.value(forKey: "empName") as? String
        return empName
    }

    
    public func getPassword()-> String?
    {
        let password : String? = userDefaults.value(forKey: "password") as? String
        return password
    }
    
    public func getPhoneNo()-> String?
    {
        let phoneNo : String? = userDefaults.value(forKey: "phoneNo") as? String
        return phoneNo
    }
    
    public func getProfileImage()-> String?
    {
        let profileImage : String? = userDefaults.value(forKey: "profileImage") as? String
        return profileImage
    }
    
    public func getDataDetail()-> ProfileDataRequestModel
    {
        let dataRequest: ProfileDataRequestModel = ProfileDataRequestModel()
        dataRequest.name = userDefaults.value(forKeyPath: "empName") as! String
        dataRequest.phone = userDefaults.value(forKeyPath: "phoneNo") as! String
        dataRequest.password = userDefaults.value(forKey: "password") as! String
//        dataRequest.profileImage = userDefaults.value(forKey: "profileImage") as! String
        return dataRequest
        
    }
    
    public func getupdateData(name:String,profileImage:String,phoneNo:String,password:String)
    {
        
        userDefaults.setValue(name, forKey: "empName")
        userDefaults.setValue(phoneNo, forKey: "phoneNo")
        userDefaults.setValue(profileImage, forKey: "profileImage")
        userDefaults.setValue(password, forKey: "password")
                userDefaults.synchronize()

    }
    
    public func getUserdefaultClear()
    {
        userDefaults.setValue(nil, forKey: "empCode")
        userDefaults.setValue(nil, forKey: "empName")
        userDefaults.setValue(nil, forKey: "phoneNo")
        userDefaults.setValue(nil, forKey: "companyName")
        userDefaults.setValue(nil, forKey: "companyLogo")
        userDefaults.setValue(nil, forKey: "profileImage")
        userDefaults.setValue(nil, forKey: "email")
        userDefaults.setValue(nil, forKey: "password")
        userDefaults.setValue(nil, forKey: "companyCode")
        userDefaults.synchronize()
}

    public func GetLoginValidate()-> Bool?
    {
        
        let validateEmail : String? = userDefaults.value(forKey: "email") as? String
         let validateCompanyname : String? = userDefaults.value(forKey: "companyName") as? String
        
        
        if (validateEmail == nil || validateCompanyname == nil)
        {
        return false
        }
        else{
        return true
        }
    
        
        
    }

}



