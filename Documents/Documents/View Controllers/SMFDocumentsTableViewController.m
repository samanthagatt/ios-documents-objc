//
//  SMFDocumentsTableViewController.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFDocumentsTableViewController.h"
#import "SMFDocumentDetailViewController.h"
#import "SMFDocumentController.h"
#import "SMFDocument.h"

#pragma mark Extension
@interface SMFDocumentsTableViewController ()

@property SMFDocumentController *documentController;

@end


#pragma mark - Implementation
@implementation SMFDocumentsTableViewController

#pragma mark - Initializers
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _documentController = [[SMFDocumentController alloc] init];
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _documentController = [[SMFDocumentController alloc] init];
    }
    return self;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.documentController.documents.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DocumentCell" forIndexPath:indexPath];

    SMFDocument *document = [self.documentController.documents objectAtIndex:indexPath.row];
    cell.textLabel.text = document.title;
    cell.detailTextLabel.text = document.body;
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SMFDocumentDetailViewController *destinationVC = segue.destinationViewController;
    destinationVC.documentController = self.documentController;
    if ([segue.identifier  isEqualToString: @"ShowExistingDocument"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        destinationVC.document = [self.documentController.documents objectAtIndex:indexPath.row];
    }
}

@end
