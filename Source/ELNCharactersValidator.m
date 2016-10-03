//
//  ELNCharactersValidator.m
//  e-legion
//
//  Created by Dmitry Nesterenko on 25.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNCharactersValidator.h"

NSString * const ELNCharactersValidatorErrorDomain = @"com.e-legion.validator.characters.error";

@implementation ELNCharactersValidator

#pragma mark - Initialization

- (instancetype)initWithAllowedCharacterSet:(NSCharacterSet *)allowedCharacterSet {
    self = [super init];
    if (self) {
        self.allowedCharacterSet = allowedCharacterSet;
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    __typeof(self) copy = [self.class new];
    copy.allowedCharacterSet = self.allowedCharacterSet;
    return copy;
}

#pragma mark - Validation

- (BOOL)isValid:(id)value error:(NSError *__autoreleasing *)error {
    if (![value isKindOfClass:[NSString class]]) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:ELNCharactersValidatorErrorDomain code:ELNCharactersValidatorErrorInvalidType userInfo:nil];
        }
        
        return NO;
    }
    
    NSString *string = value;
    
    if (self.allowedCharacterSet == nil) {
        return YES;
    }
    
    NSCharacterSet *invalidCharacterSet = self.allowedCharacterSet.invertedSet;
    return [string rangeOfCharacterFromSet:invalidCharacterSet].location == NSNotFound;
}

@end
