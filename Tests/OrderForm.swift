//
//  OrderForm.swift
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 19.08.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

import Foundation
import ELNValidators

enum OrderFormError: Error {
    
    case invalidFirstName
    
    case invalidEmail
    
    case invalidLastName
    
    var localizedDescription: String {
        switch self {
        case .invalidFirstName:
            return "Please enter your first name"
        case .invalidLastName:
            return "Please enter your last name"
        case .invalidEmail:
            return "Please enter valid email"
        }
    }
    
}

class OrderForm : Form {
    
    var firstName: String?
    
    var lastName: String?
    
    var email: String?
    
    func validateFirstName(_ ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
        guard let _ = ioValue.pointee as? String else {
            throw OrderFormError.invalidFirstName
        }
    }
    
    func validateLastName(_ ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
        guard let _ = ioValue.pointee as? String else {
            throw OrderFormError.invalidLastName
        }
    }
    
    func validateEmail(_ ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>) throws {
        guard let value = ioValue.pointee as? String else {
            throw OrderFormError.invalidEmail
        }
        
        do {
            try EmailValidator().validate(value)
        } catch {
            throw OrderFormError.invalidEmail
        }
    }

}
