//
//  ELNEmailValidator.h
//  ELNValidators
//
//  Created by Dmitry Nesterenko on 25.02.16.
//  Copyright © 2016 e-legion. All rights reserved.
//

#import "ELNValidatorType.h"

extern NSString * const ELNEmailValidatorErrorDomain;

typedef NS_ENUM(NSInteger, ELNEmailValidatorError) {
    ELNEmailValidatorErrorInvalidType = 1,
    ELNEmailValidatorErrorEmailLenghtInsufficient
};

@interface ELNEmailValidator : NSObject <ELNValidatorType>

@end
