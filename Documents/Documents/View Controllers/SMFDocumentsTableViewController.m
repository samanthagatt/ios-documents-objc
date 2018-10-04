//
//  SMFDocumentsTableViewController.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "SMFDocumentsTableViewController.h"
#import "SMFDocumentDetailViewController.h"
#import "SMFDocumentController.h"
#import "SMFDocumentCD+CoreDataClass.h"
#import "NSString+SMFWordCount.h"

#pragma mark Extension
@interface SMFDocumentsTableViewController ()

@property NSFetchedResultsController *frc;
@property SMFDocumentController *documentController;

@end


#pragma mark - Implementation
@implementation SMFDocumentsTableViewController

#pragma mark - Initializers
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"The table vc has been initialized!!");
        _documentController = [[SMFDocumentController alloc] init];
        [self setUpFRC];
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"The table vc has been initialized!!");
        _documentController = [[SMFDocumentController alloc] init];
        [self setUpFRC];
    }
    return self;
}

#pragma mark - Functions
#pragma mark Setting up the fetched results controller
// Only to be used in initializers (assigns _frc directly)
- (void)setUpFRC {
    NSManagedObjectContext *context = self.documentController.moc;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"SMFDocumentCD"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    _frc = [[NSFetchedResultsController alloc]
            initWithFetchRequest:fetchRequest
            managedObjectContext:context
            sectionNameKeyPath:nil
            cacheName:nil];
    
    NSError *error;
    __unused BOOL success = [_frc performFetch:&error];
    
    _frc.delegate = self;
}

#pragma mark - FetchedResultsControllerDelgate
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeMove:
            break;
        case NSFetchedResultsChangeUpdate:
            break;
    }
}
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:5];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.frc.fetchedObjects.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DocumentCell" forIndexPath:indexPath];

    SMFDocumentCD *document = [self.frc objectAtIndexPath:indexPath];
    cell.textLabel.text = document.title;
    int wordCount = [document.body wordCount];
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%i", wordCount];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SMFDocumentCD *document = [self.frc objectAtIndexPath:indexPath];
        [self.documentController deleteDocument:document];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SMFDocumentDetailViewController *destinationVC = segue.destinationViewController;
    destinationVC.documentController = self.documentController;
    
    if ([segue.identifier  isEqualToString: @"ShowExistingDocument"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        destinationVC.document = [self.frc objectAtIndexPath:indexPath];
    }
}

@end
