//
//  SMFDocumentController.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFDocumentController.h"
#import "SMFDocument.h"


#pragma mark Extension
@interface SMFDocumentController ()

#pragma mark - Properties
@property (readwrite) NSMutableArray *documents;

@end


#pragma mark - Implementation
@implementation SMFDocumentController

#pragma mark - Initializer
- (instancetype)init
{
    self = [super init];
    if (self) {
        // Initializes documents as an empty array
        _documents = [[NSMutableArray alloc]init];
    }
    return self;
}


#pragma mark - Methods

#pragma mark Create
- (void)createWithTitle:(NSString *)title body:(NSString *)body {
    SMFDocument *document = [[SMFDocument alloc] initWithTitle:title body:body];
    [self.documents addObject:document];
}

#pragma mark Update
- (void)updateDocument:(SMFDocument *)document title:(NSString *)title body:(NSString *)body {
    NSUInteger index = [[self documents] indexOfObject:document];
    [[self.documents objectAtIndex:index] setTitle:title];
    [[self.documents objectAtIndex:index] setBody:body];
}

#pragma mark Delete
- (void)deleteDocument:(SMFDocument *)document {
    [self.documents removeObject:document];
}

@end
