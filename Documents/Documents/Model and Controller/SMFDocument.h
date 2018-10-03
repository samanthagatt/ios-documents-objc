//
//  SMFDocument.h
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMFDocument : NSObject

-(instancetype)initWithTitle:(NSString *)title body:(NSString *)body;

@property NSString *title;
@property NSString *body;
@property (readonly) int wordCount;

@end

NS_ASSUME_NONNULL_END
