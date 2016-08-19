//
//  Validator.swift
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 19.08.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

import Foundation

public protocol Validator {
    
    associatedtype Value
    
    func validate(_ value: Value?) throws
    
}
