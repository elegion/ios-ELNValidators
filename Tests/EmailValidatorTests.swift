//
//  EmailValidatorTests.swift
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 19.08.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

import XCTest
import ELNValidators

class EmailValidatorTests: XCTestCase {
    
    var validator: EmailValidator!
    
    override func setUp() {
        super.setUp()
        validator = EmailValidator()
    }
    
    func testInvalidValue() {
        do {
            try validator.validate("invalidemail")
            XCTAssert(false)
        } catch {
            XCTAssert(true)
        }
    }
    
    func testValidValue() {
        do {
            try validator.validate("name@localhost")
            XCTAssert(true)
        } catch {
            XCTAssert(false)
        }
    }
    
}
