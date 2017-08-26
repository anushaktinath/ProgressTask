//
//  PTUserData.swift
//  ProgressTask
//
//  Created by Mishra, Anu (US - Mumbai) on 8/23/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

struct PTUserData {
    
    private struct keys{
    
   static let firstName = "first_name"
   static let lastName = "last_name"
   static let id = "id"
    
    }
    
    var firstName :String?
    var lastName :String?
    var id :Int?
    
    init?(dictonary:[String:Any]?) {
        guard let dict = dictonary else{
            return nil
        }
        self.firstName = dict[keys.firstName] as? String
        self.lastName = dict[keys.lastName] as? String
        self.id = dict[keys.id] as? Int

    }
    
}

