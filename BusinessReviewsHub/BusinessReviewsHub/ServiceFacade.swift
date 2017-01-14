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
    
   var baseUrl : String 
    
    init( configUrl : String?)
    {
        baseUrl = configUrl!
    }
    
    
    public func EmployeeLogin(userRegistration : UserRegistrationModel? ,
                              userInfo: UserInfoModel?,
                              completionHandler :  @escaping (EmpLoginResponseModel?)->Void)
    {
        let endPointUrl : URL = URL(string:baseUrl + "/emplogin")!
        let dataRegisterString : String? = userRegistration?.toJsonString()
        let userRegisterString : String? = userInfo?.toJsonString()
        
        let requestRegisterParameter : Parameters = buildRequestParameters(
            dataString: dataRegisterString, userString: userRegisterString)
        
        
        
        Alamofire.request(endPointUrl,
                          method: .post,
                          parameters: requestRegisterParameter,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON{
             response in
                var employeeLoginReponseModel: EmpLoginResponseModel? = EmpLoginResponseModel()
            guard response.result.isSuccess else{
                completionHandler(employeeLoginReponseModel)
                return
            }
            guard  let responseValue = response.result.value as? [String : AnyObject]
                else{
                    completionHandler(employeeLoginReponseModel)
                    return
            
            }
                
            let responseErrorCode : Int32 = responseValue["errorCode"] as! Int32
                employeeLoginReponseModel?.errorCode = responseErrorCode
            //print(responseErrorCode)
            let responseErrorMessage : String = (responseValue["message"] as? String)!
                employeeLoginReponseModel?.message = responseErrorMessage
            //print(responseErrorMessage)
            
                if(responseErrorCode == 0){
                    let responseRegistrationData : String? = responseValue["data"] as? String
                
                    let dict : NSDictionary = EVReflection.dictionaryFromJson(responseRegistrationData);
                   
                     employeeLoginReponseModel = EVReflection.setPropertiesfromDictionary(dict, anyObject: employeeLoginReponseModel!)
                    employeeLoginReponseModel? = EmpLoginResponseModel(json : responseRegistrationData)

                }
                          completionHandler(employeeLoginReponseModel)
        }
        
    }
    
    
    public func SendSms(sendsmsDataRequest : SendSmsDataRequestModel?,
                        sendsmsUserRequest : UserRequestModel?,
                        completionHandler: @escaping (BaseResponseModel?)->Void)
    {
        let endPointUrl :URL = URL(string:baseUrl + "/sendsms")!
        let dataString : String? = sendsmsDataRequest?.toJsonString()
        let userString : String? = sendsmsUserRequest?.toJsonString()
        let requestSendSmsparameter : Parameters = buildRequestParameters(dataString: dataString, userString: userString)
        
        Alamofire.request(endPointUrl,
                          method: .post,
                          parameters: requestSendSmsparameter,
                          encoding: JSONEncoding.default,
                          headers: nil).responseJSON{
                            response in
                            let baseresponseModel : BaseResponseModel = BaseResponseModel()
                            guard response.result.isSuccess else{
                                completionHandler(baseresponseModel)
                                return
                            }
                            guard let sendsmsResponseValue = response.result.value as? [String : AnyObject]
                                else{
                                    
                            completionHandler(baseresponseModel)
                                    return
                            }
                            let responseErrorCode : Int32 = sendsmsResponseValue["errorCode"] as! Int32
                            baseresponseModel.errorCode = responseErrorCode
                            print(responseErrorCode)
                            let responseMessage : String = (sendsmsResponseValue["message"] as? String)!
                           baseresponseModel.message = responseMessage
                            print(responseMessage)
                            completionHandler(baseresponseModel)
                        }
    
    }
    
   
    
   
    public func SmsHistory(smsHistoryDataRequest : SmsHistoryDataRequestModel?,smsHistoryUserRequest : UserRequestModel?,
                        completionHandler: @escaping ([SmsHistoryResponseModel?])->Void)
    {
        let endPointUrl :URL = URL(string:baseUrl + "/smshistory")!
        let dataString : String? = smsHistoryDataRequest?.toJsonString()
        let userString : String? = smsHistoryUserRequest?.toJsonString()
        let requestSmsHistoryparameter : Parameters = buildRequestParameters(dataString:dataString, userString: userString)
        
        Alamofire.request(endPointUrl,
                          method: .post,
                          parameters: requestSmsHistoryparameter,
                          encoding: JSONEncoding.default,
                          headers: nil).responseJSON{
                            response in
                      //      var smshistoryResponse : SmsHistoryResponseModel = SmsHistoryResponseModel()
                            guard response.result.isSuccess else{
                                //completionHandler(smshistoryResponse)
                                return
                            }
                            guard let smsHistoryResponseValue = response.result.value as? [String : AnyObject]
                                else{
                                    
                                    //completionHandler(smshistoryResponse)
                                    return
                            }
                            let responseErrorCode : Int32 = smsHistoryResponseValue["errorCode"] as! Int32
                            print(responseErrorCode)
//                            let responseMessage : String = (smsHistoryResponseValue["message"] as? String)!
//                            print(responseMessage)
                            var dict: Array<SmsHistoryResponseModel> = []
                            if(responseErrorCode == 0)
                            {
                                let responseData : String = (smsHistoryResponseValue["data"] as? String)!
                                 dict=[SmsHistoryResponseModel](json:responseData)
                                
                            }
                            
                            completionHandler(dict)
                         
        }
    }

    
    public func ProfileUpdate(profileDataRequest : ProfileDataRequestModel? ,
                              profileUserRequest: UserRequestModel?,
                              completionHandler :  @escaping (ProfileUpdateResponseModel?)->Void)
    {
        let endPointUrl : URL = URL(string:baseUrl + "/empupdate")!
        let dataProfileString : String? = profileDataRequest?.toJsonString()
        let userProfileString : String? = profileUserRequest?.toJsonString()
        
        let requestProfileParameter : Parameters = buildRequestParameters(
            dataString: dataProfileString, userString: userProfileString)
        
        
        
        Alamofire.request(endPointUrl,
                          method: .post,
                          parameters: requestProfileParameter,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON{
                response in
                var profileupdateResponse : ProfileUpdateResponseModel = ProfileUpdateResponseModel()
                guard response.result.isSuccess else{
                    completionHandler(profileupdateResponse)
                    return
                }
                guard  let responseValue = response.result.value as? [String : AnyObject]
                    else{
                        completionHandler(profileupdateResponse)
                        return
                        
                }
                
                let responseErrorCode : Int32 = responseValue["errorCode"] as! Int32
                profileupdateResponse.errorCode = responseErrorCode
                print(responseErrorCode)
                let responseErrorMessage : String = (responseValue["message"] as? String)!
                profileupdateResponse.message = responseErrorMessage
                print(responseErrorMessage)
                
                if(responseErrorCode == 0){
                    let responseRegistrationData : String? = responseValue["data"] as? String
                    
                    let dict : NSDictionary = EVReflection.dictionaryFromJson(responseRegistrationData);
                    
                    profileupdateResponse = EVReflection.setPropertiesfromDictionary(dict, anyObject: profileupdateResponse)
                    profileupdateResponse = ProfileUpdateResponseModel(json : responseRegistrationData)
                    
                }
                completionHandler(profileupdateResponse)
        }
        
    }






    private func buildRequestParameters(dataString:String?, userString: String?) -> Parameters{
        var params: Parameters = Parameters()
        
        params["data"] = dataString as AnyObject?
        params["user"] = userString as AnyObject?
        return params
    }





}
