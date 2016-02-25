//
//  ELNCompositeValidator.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 26.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNValidatorType.h"

@interface ELNCompositeValidator : NSObject <ELNValidatorType>

- (void)addValidator:(id<ELNValidatorType>)validator;

@end
