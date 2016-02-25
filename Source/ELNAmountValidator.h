//
//  ELNAmountValidator.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 25.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNStringLengthValidator.h"

@interface ELNAmountValidator : NSObject <ELNValidatorType>

/// Default integer part length is 15 digits
@property (nonatomic, assign) NSUInteger maximumIntegerLength;

/// Default fractional part length is 2 digits
@property (nonatomic, assign) NSUInteger maximumFractionalLength;

/// Default value is nil
@property (nonatomic, strong) NSNumber *maxValue;

/// Number formatter is used to validate maxValue.
@property (nonatomic, strong, readonly) NSNumberFormatter *numberFormatter;

@end
