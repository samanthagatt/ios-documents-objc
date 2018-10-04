//
//  SMFDocumentCD+SMFConvenience.h
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFDocumentCD+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMFDocumentCD (SMFConvenience)

-(instancetype)initWithTitle:(NSString *)title body:(NSString *)body context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
