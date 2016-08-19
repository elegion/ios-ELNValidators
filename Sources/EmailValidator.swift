//
//  EmailValidator.swift
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 19.08.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

import Foundation

public enum EmailValidatorError : Error {
    
    case invalid
    
}

open class EmailValidator : Validator {
    
    public init() {
        
    }
    
    public func validate(_ value: String?) throws {
        if let value = value, value.characters.split(separator: "@").count == 2 {
            return
        }
        
        throw EmailValidatorError.invalid
    }
    
}
