//
//  SmsHistoryViewController.swift
//  BusinessReviewsHub
//
//  Created by Prakash Sabale on 30/12/16.
//  Copyright © 2016 BusinessReviewsHub. All rights reserved.
//

import UIKit

class SmsHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    
    @IBOutlet weak var tableView: UITableView!
    var userDefaultManager : UserdefaultManager = UserdefaultManager()
    var smsHistory : [SmsHistoryResponseModel] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let smsHistoryUserRequest : UserRequestModel? = self.userDefaultManager.getuserDetail()
        let smsHistoryDataRequest : SmsHistoryDataRequestModel = SmsHistoryDataRequestModel()
        
        
        let serviceFacade = ServiceFacade(configUrl: PropertyFileReader.getBaseUrl())
        serviceFacade.SmsHistory(smsHistoryDataRequest: smsHistoryDataRequest,
                                 smsHistoryUserRequest: smsHistoryUserRequest,
                                 completionHandler: {
                                    response in
                                    self.smsHistory = response as! [SmsHistoryResponseModel]
                                    self.tableView.reloadData()
                                    
        })
        
        
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return smsHistory.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        let serverdateFormatter = DateFormatter()
        serverdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let strDate:String = self.smsHistory[indexPath.row].smsDate
        let date = serverdateFormatter.date(from: strDate)
        
        let displayDateFormatter = DateFormatter()
        displayDateFormatter.dateFormat = "MMM d"
        
        let displayTimeFormatter = DateFormatter()
        displayTimeFormatter.dateFormat = "hh:mm a"

        
        let displayDate = displayDateFormatter.string(from: date!)
        let displayTime = displayTimeFormatter.string(from: date!)
        
        
        cell.custnameLabel.text? = self.smsHistory[indexPath.row].customerName
        cell.phoneNoLabel.text? = self.smsHistory[indexPath.row].phoneNo
        cell.dateDaylabel.text? = displayDate
        cell.timelabel.text? = displayTime
        
        return (cell)
        
    }
    


    

    
}
