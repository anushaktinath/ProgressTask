//
//  PTRequestApiManager.swift
//  ProgressTask
//
//  Created by Mishra, Anu (US - Mumbai) on 8/23/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

class PTRequestApiManager: NSObject {
   static var baseURL = "http://scripting.com/rss.json"
    
   static  func post(postString : String, httpMethod : String, postCompleted : @escaping (_ succeeded: Bool, _ msg: String, _ responceData:AnyObject) -> (), onFailure: @escaping(Error) -> Void) {
        if postString != "" {
            baseURL = "https://reqres.in"
        }
        let url : String = baseURL + postString
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = httpMethod
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
          
            // check for any errors
            guard error == nil else {
                onFailure(error!)
                return
            }
            
            guard let responseData = data else {
                onFailure(error!)
                return
            }
            
            do {
                guard let parsedJson = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    onFailure(error!)
                    return
                }
                
                //print("Service Response : " + parsedJson.description)
                postCompleted(true,"success",parsedJson as AnyObject)
                
            } catch  {
                onFailure(error)
                return
            }
            
        })
        
        task.resume()
    }
}
