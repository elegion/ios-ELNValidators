//
//  Tests.swift
//  Tests
//
//  Created by Dmitry Nesterenko on 19.08.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

import XCTest

class Tests: XCTestCase {
    
    var form: OrderForm!
    
    override func setUp() {
        super.setUp()
        form = OrderForm()
    }
    
    func testInvalidForm() {
        form.firstName = nil
        form.lastName = nil
        form.email = nil
        XCTAssertGreaterThan(form.errors.count, 0)
    }

    func testValidForm() {
        form.firstName = "first name"
        form.lastName = "last name"
        form.email = "name@localhost"
        XCTAssertEqual(form.errors.count, 0)
    }

}
