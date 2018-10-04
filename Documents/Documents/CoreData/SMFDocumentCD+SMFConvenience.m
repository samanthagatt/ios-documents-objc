//
//  SMFDocumentCD+SMFConvenience.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFDocumentCD+SMFConvenience.h"

@implementation SMFDocumentCD (SMFConvenience)

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body context:(NSManagedObjectContext *)context {
    self = [self initWithContext:context];
    if (self) {
        self.title = title;
        self.body = body;
    }
    return self;
}

@end
