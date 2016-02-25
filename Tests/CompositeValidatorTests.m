//
//  CompositeValidatorTests.m
//  Validators
//
//  Created by Dmitry Nesterenko on 25.02.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ELNCompositeValidator.h"
#import "ELNCharactersValidator.h"
#import "ELNStringLengthValidator.h"

@interface CompositeValidatorTests : XCTestCase

@property (nonatomic, strong) ELNCompositeValidator *validator;

@end

@implementation CompositeValidatorTests

- (void)setUp {
    [super setUp];
    self.validator = [ELNCompositeValidator new];
}

- (void)testValidValue {
    ELNCharactersValidator *digitsValidator = [[ELNCharactersValidator alloc] initWithAllowedCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    ELNStringLengthValidator *stringLengthValidator = [[ELNStringLengthValidator alloc] initWithMinLength:0 maxLength:3];
    [self.validator addValidator:digitsValidator];
    [self.validator addValidator:stringLengthValidator];
    
    XCTAssertTrue([self.validator isValid:@"123" error:nil]);
}

- (void)testInvalidValue {
    ELNCharactersValidator *digitsValidator = [[ELNCharactersValidator alloc] initWithAllowedCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    ELNStringLengthValidator *stringLengthValidator = [[ELNStringLengthValidator alloc] initWithMinLength:0 maxLength:3];
    [self.validator addValidator:digitsValidator];
    [self.validator addValidator:stringLengthValidator];
    
    XCTAssertFalse([self.validator isValid:@"asdfasadf" error:nil]);
}


@end
