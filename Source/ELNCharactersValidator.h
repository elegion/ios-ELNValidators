//
//  ELNCharactersValidator.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 25.11.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import "ELNValidatorType.h"

@interface ELNCharactersValidator : NSObject <ELNValidatorType>

@property (nonatomic, copy) NSCharacterSet *allowedCharacterSet;

- (instancetype)initWithAllowedCharacterSet:(NSCharacterSet *)allowedCharacterSet;

@end
