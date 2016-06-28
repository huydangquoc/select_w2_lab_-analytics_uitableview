//
//  FancyClient.swift
//  select_w2_lab
//
//  Created by Dang Quoc Huy on 6/28/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import Foundation

let fancyURL = "https://fancy-raptor.hyperdev.space/"
let fancyURLWithParam = "https://fancy-raptor.hyperdev.space/?offset=%d&limit=%d"

struct SearchParam {
    static let Offset = "offset"
    static let Limit = "limit"
}

class FancyClient {
    
    class func loadPerson(offset offset: Int, limit: Int, completion: ([Person]?, NSError?) -> Void) {
        
        let query = String(format: fancyURLWithParam, offset, limit)
        let url = NSURL(string: query)!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, err: NSError?) in
            guard err == nil else  {
                completion(nil, err)
                return
            }
            
            do {
                let data = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSMutableArray
                var persons = [Person]()
                for p in data {
                    let dictionary = p as! NSDictionary
                    persons.append(Person(dictionary: dictionary))
                }
                completion(persons, nil)
                
            } catch let error as NSError{
                completion(nil, error)
            }
        }
        task.resume()
    }
}
