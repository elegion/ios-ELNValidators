//
//  StringLengthValidatorTests.m
//  Validators
//
//  Created by Dmitry Nesterenko on 25.02.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Validators.h"

@interface StringLengthValidatorTests : XCTestCase

@property (nonatomic, strong) ELNStringLengthValidator *validator;

@end

@implementation StringLengthValidatorTests

- (void)setUp {
    [super setUp];
    self.validator = [ELNStringLengthValidator new];
}

- (void)testValidMinAndMaxLengthValue {
    self.validator.minLength = 3;
    self.validator.maxLength = 10;
    XCTAssertTrue([self.validator isValid:@"12345" error:nil]);
}

- (void)testInvalidMinAndMaxLengthValue {
    self.validator.minLength = 3;
    self.validator.maxLength = 10;
    XCTAssertFalse([self.validator isValid:@"1" error:nil]);
}

@end
