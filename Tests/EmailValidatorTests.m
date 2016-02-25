//
//  EmailValidatorTests.m
//  Validators
//
//  Created by Dmitry Nesterenko on 25.02.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Validators.h"

@interface EmailValidatorTests : XCTestCase

@property (nonatomic, strong) ELNEmailValidator *validator;

@end

@implementation EmailValidatorTests

- (void)setUp {
    [super setUp];
    self.validator = [ELNEmailValidator new];
}


- (void)testValidValue {
    XCTAssertTrue([self.validator isValid:@"test@test" error:nil]);
}

- (void)testInvalidValue {
    XCTAssertFalse([self.validator isValid:@"test" error:nil]);
}

@end
