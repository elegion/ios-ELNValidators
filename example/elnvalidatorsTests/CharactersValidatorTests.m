//
//  CharactersValidatorTests.m
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 25.02.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ELNValidators.h"

@interface CharactersValidatorTests : XCTestCase

@property (nonatomic, strong) ELNCharactersValidator *validator;

@end

@implementation CharactersValidatorTests

- (void)setUp {
    [super setUp];
    self.validator = [ELNCharactersValidator new];
}


- (void)testValidCharacters {
    self.validator.allowedCharacterSet = [NSCharacterSet decimalDigitCharacterSet];
    XCTAssertTrue([self.validator isValid:@"123" error:nil]);
}

- (void)testInvalidCharacters {
    self.validator.allowedCharacterSet = [NSCharacterSet decimalDigitCharacterSet];
    XCTAssertFalse([self.validator isValid:@"asdf" error:nil]);
}

@end
