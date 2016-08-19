//
//  PropertiesNamesSequeunce.swift
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 19.08.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

class PropertiesNamesSequence : Sequence {
    
    let object: AnyObject
    
    init(_ object: AnyObject) {
        self.object = object
    }
    
    func makeIterator() -> AnyIterator<String> {
        var count: UInt32 = 0
        let properties = class_copyPropertyList(type(of: object), &count)
        var i: Int = 0
        
        return AnyIterator { body in
            guard let properties = properties, i < Int(count) else {
                return nil
            }
            
            let property = properties[i]
            if
                let name = property_getName(property),
                let string = NSString(cString: name, encoding: String.Encoding.utf8.rawValue) {
                i += 1
                return string as String
            }
            
            return nil
        }
    }
    
}
