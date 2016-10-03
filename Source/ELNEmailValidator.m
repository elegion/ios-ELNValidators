//
//  ELNEmailValidator.m
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 25.02.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import "ELNEmailValidator.h"

NSString * const ELNEmailValidatorErrorDomain = @"com.e-legion.validator.email.error";

@implementation ELNEmailValidator

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    __typeof(self) copy = [self.class new];
    return copy;
}

- (BOOL)isValid:(id)value error:(NSError *__autoreleasing *)error {
    if (![value isKindOfClass:[NSString class]]) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNEmailValidatorErrorDomain code:ELNEmailValidatorErrorInvalidType userInfo:nil];
        }
        
        return NO;
    }
    
    NSString *string = value;
    
    NSArray<NSString *> *components = [string componentsSeparatedByString:@"@"];
    if (components.count != 2) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNEmailValidatorErrorDomain code:ELNEmailValidatorErrorEmailLenghtInsufficient userInfo:nil];
        }
        
        return NO;
    }
    
    return YES;
}

@end
