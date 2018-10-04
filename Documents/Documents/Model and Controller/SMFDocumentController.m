//
//  SMFDocumentController.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "SMFDocumentController.h"
#import "SMFDocumentCD+SMFConvenience.h"
#import "SMFCoreDataStack.h"


#pragma mark Extension
@interface SMFDocumentController ()

#pragma mark - Properties
@property (readwrite) NSMutableArray *documents;
@property (readwrite) NSManagedObjectContext *moc;

@end


#pragma mark - Implementation
@implementation SMFDocumentController

#pragma mark - Initializer
- (instancetype)init
{
    self = [super init];
    if (self) {
        _moc = [[[[SMFCoreDataStack alloc] init] container] viewContext];
    }
    return self;
}


#pragma mark - CoreData
- (void)saveToPersistentStore {
    NSError *error = nil;
    if ([self.moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

#pragma mark - CRUD
#pragma mark Create
- (void)createWithTitle:(NSString *)title body:(NSString *)body {
    __unused SMFDocumentCD *d = [[SMFDocumentCD alloc] initWithTitle:title body:body context:self.moc];
    [self saveToPersistentStore];
}

#pragma mark Update
- (void)updateDocument:(SMFDocumentCD *)document title:(NSString *)title body:(NSString *)body {
    document.title = title;
    document.body = body;
    [self saveToPersistentStore];
}

#pragma mark Delete
- (void)deleteDocument:(SMFDocumentCD *)document {
    [self.moc deleteObject:document];
    [self saveToPersistentStore];
}

@end
