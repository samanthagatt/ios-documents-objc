//
//  SMFDocumentController.h
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMFDocumentCD;

NS_ASSUME_NONNULL_BEGIN

@interface SMFDocumentController : NSObject

@property (readonly) NSMutableArray *documents;
@property (readonly) NSManagedObjectContext *moc;

- (void)createWithTitle:(NSString *)title body:(NSString *)body;
- (void)updateDocument:(SMFDocumentCD *)document title:(NSString *)title body:(NSString *)body;
- (void)deleteDocument:(SMFDocumentCD *)document;

@end

NS_ASSUME_NONNULL_END
