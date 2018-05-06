//
//  JSONLoader.swift
//  Pokemon Weakness
//
//  Created by Oscar Duran on 18/7/16.
//  Copyright © 2016 Skydev. All rights reserved.
//

import Foundation
import PromiseKit

class JSONLoader {
    
    /**
     Loads a JSON fixture from the test bundle
     
     - parameter filePath: file path for the json fil
     
     - returns: the return json value
     */
    static func fixture<T>(_ filePath: String) -> T {
        let bundle = Bundle(for:object_getClass(self))
        let jsonFile = bundle.path(forResource: filePath, ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
        
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.allowFragments)
            return json as! T
        } catch {}
        
        return [:] as! T
    }
    
    static func fixturePromise<T>(_ filePath: String) -> Promise<T> {
        return Promise { fulfill, reject in
            fulfill(
                fixture(filePath)
            )
        }
    }

}
