//
//  SMFDocumentController.h
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMFDocument;

NS_ASSUME_NONNULL_BEGIN

@interface SMFDocumentController : NSObject

@property (readonly) NSMutableArray *documents;

- (void)createWithTitle:(NSString *)title body:(NSString *)body;
- (void)updateDocument:(SMFDocument *)document title:(NSString *)title body:(NSString *)body;
- (void)deleteDocument:(SMFDocument *)document;

@end

NS_ASSUME_NONNULL_END
