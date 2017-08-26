//
//  PTRSSFeedViewController.swift
//  ProgressTask
//
//  Created by Mishra, Anu (US - Mumbai) on 8/24/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

class PTRSSFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getRSSFeedData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRSSFeedData() {
        PTRequestApiManager.post(postString: "", httpMethod: "GET", postCompleted:  { (succeeded: Bool, msg: String, responceData:AnyObject) -> () in
            let response = responceData as! [String:Any]
            
            let rss = response["rss"] as! [String: Any]
            let channel = rss["channel"] as! [String:Any]
            let rssFeed = channel["item"] as! [Any]
            
            PTRSSDataManager.shared.storeRSSFeedData(rssFeed: rssFeed)
            //let output = PTRSSDataManager.shared.getRssFeed()
            
            
        }, onFailure: { error in
            print(error.localizedDescription)
        })
        
    }
    
   

}
