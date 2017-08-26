//
//  PTLoginViewController.swift
//  ProgressTask
//
//  Created by Mishra, Anu (US - Mumbai) on 8/23/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

class PTLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.submitButtonClicked()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func submitButtonClicked() {
        let user = "/api/users/2"
        PTRequestApiManager.post(postString: user, httpMethod: "GET", postCompleted:  { (succeeded: Bool, msg: String, responceData:AnyObject) -> () in
            let response = responceData as! [String:Any]
            let user = response["data"] as! [String:Any]
            
            PTRSSDataManager.shared.storeUserData(userDictonary: user)
            let output = PTRSSDataManager.shared.getUserData()
            
            
        }, onFailure: { error in
            print(error.localizedDescription)
        })

        
    }

}
