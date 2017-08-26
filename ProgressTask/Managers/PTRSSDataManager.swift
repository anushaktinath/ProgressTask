//
//  PTRSSDataManager.swift
//  ProgressTask
//
//  Created by Mishra, Anu (US - Mumbai) on 8/24/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

class PTRSSDataManager: NSObject {
    static let shared = PTRSSDataManager()
    var rssFeedArray = [PTRSSFeedData]()
    var user : PTUserData?
    
    func storeRSSFeedData(rssFeed:[Any]) {
        for (_, value) in rssFeed.enumerated() {
            // your code
            if let feeds = PTRSSFeedData.init(dictonary: value as? [String : Any]){
                rssFeedArray.append(feeds)
                
            }
        }
    }
    
    func getRssFeed() -> [PTRSSFeedData] {
       return self.rssFeedArray
    }
    
    func storeUserData(userDictonary:[String:Any]) {
        self.user = PTUserData.init(dictonary: userDictonary)
    }
    
    func getUserData() -> PTUserData {
        return self.user!
    }
   
    
}
