//
//  PTRSSFeedData.swift
//  ProgressTask
//
//  Created by Mishra, Anu (US - Mumbai) on 8/23/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

struct PTRSSFeedData{
    
    private struct keys{
      static let link = "link"
      static let description = "description"
      static let date = "pubDate"
        
    }
    
     var link : String?
     var description : String?
     var date : String?
    
    init?(dictonary:[String:Any]?) {
        guard let dict = dictonary else{
           return nil
        }
        self.link = dict[keys.link] as? String
        self.description = dict[keys.description] as? String
        self.date = dict[keys.date] as? String

        
    }
    
}
