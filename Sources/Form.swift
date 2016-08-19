//
//  Form.swift
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 19.08.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

import Foundation

open class Form : NSObject {
    
    open func validate() throws {
        for propertyName in PropertiesNamesSequence(self) {
            var value = self.value(forKey: propertyName) as AnyObject?
            try validateValue(&value, forKey: propertyName)
        }
    }
    
    // Returns all errors
    open var errors: [Error] {
        return PropertiesNamesSequence(self).flatMap { propertyName in
            var value = self.value(forKey: propertyName) as AnyObject?
            do {
                try validateValue(&value, forKey: propertyName)
                return nil
            } catch let error {
                return error
            }
        }
    }
    
}
