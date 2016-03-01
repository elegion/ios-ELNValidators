//
//  AmountValidatorTests.m
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 25.02.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ELNValidators.h"

@interface ValidatorsTests : XCTestCase

@property (nonatomic, strong) ELNAmountValidator *validator;

@end

@implementation ValidatorsTests

- (void)setUp {
    [super setUp];
    self.validator = [ELNAmountValidator new];
}

- (void)testValidMaximumIntegerLength {
    XCTAssertTrue([self.validator isValid:@"123.12" error:nil]);
}

- (void)testInvalidMaximumIntegerLength {
    self.validator.maximumIntegerLength = 3;
    XCTAssertFalse([self.validator isValid:@"12345.12" error:nil]);
}

- (void)testValidMaximumFractionLength {
    XCTAssertTrue([self.validator isValid:@"123.12" error:nil]);
}

- (void)testInvalidMaximumFractionLength {
    self.validator.maximumFractionalLength = 0;
    XCTAssertFalse([self.validator isValid:@"12345.12" error:nil]);
}

- (void)testValidMaxValue {
    self.validator.maxValue = @999;
    XCTAssertTrue([self.validator isValid:@"123.12" error:nil]);
}

- (void)testInvalidMaxValue {
    self.validator.maxValue = @999;
    XCTAssertFalse([self.validator isValid:@"1234.12" error:nil]);
}

- (void)testFractionNotAllowedError {
    self.validator.maximumFractionalLength = 0;
    NSError *error;
    XCTAssertFalse([self.validator isValid:@"1234." error:&error]);
    XCTAssertEqual(error.code, ELNAmountValidatorErrorFractionNotAllowed);
}

- (void)testMaximumValueExceededError {
    self.validator.maxValue = @10;
    NSError *error;
    XCTAssertFalse([self.validator isValid:@"100" error:&error]);
    XCTAssertEqual(error.code, ELNAmountValidatorErrorMaximumValueExceeded);
}

@end
