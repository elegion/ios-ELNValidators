//
//  ELNStringLengthValidator.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 26.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNStringLengthValidator.h"

NSString * const ELNStringLengthValidatorErrorDomain = @"com.e-legion.validator.stringLenght.error";

@implementation ELNStringLengthValidator

- (instancetype)initWithMinLength:(NSUInteger)minLength maxLength:(NSUInteger)maxLength {
    self = [super init];
    if (self) {
        self.minLength = minLength;
        self.maxLength = maxLength;
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    __typeof(self) copy = [self.class new];
    copy.minLength = self.minLength;
    copy.maxLength = self.maxLength;
    return copy;
}

#pragma mark - Validation

- (BOOL)isValid:(id)value error:(NSError *__autoreleasing *)error {
    if (![value isKindOfClass:[NSString class]]) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNStringLengthValidatorErrorDomain code:ELNStringLengthValidatorErrorInvalidType userInfo:nil];
        }
        
        return NO;
    }
    
    NSString *string = value;

    // min length
    if (string.length < self.minLength) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNStringLengthValidatorErrorDomain code:ELNStringLengthValidatorErrorMinimumValueInsufficient userInfo:nil];
        }
        
        return NO;
    }
    
    // max length
    if (string.length > self.maxLength) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNStringLengthValidatorErrorDomain code:ELNStringLengthValidatorErrorMaximumValueExceeded userInfo:nil];
        }
        
        return NO;
    }
    
    return YES;
}

@end
