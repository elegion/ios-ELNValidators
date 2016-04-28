//
//  ELNValidator.h
//  e-legion
//
//  Created by Dmitry Nesterenko on 16.10.15.
//  Copyright © 2015 e-legion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ELNValidatorType <NSObject, NSCopying>

- (BOOL)isValid:(nullable id)value error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
