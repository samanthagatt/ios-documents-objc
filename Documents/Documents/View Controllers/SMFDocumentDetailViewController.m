//
//  SMFDocumentDetailViewController.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFDocumentDetailViewController.h"
#import "SMFDocument.h"
#import "SMFDocumentController.h"


#pragma mark Extension
@interface SMFDocumentDetailViewController ()

#pragma mark - Outlets
@property (weak, nonatomic) IBOutlet UILabel *wordCountLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

#pragma mark - Actions
- (IBAction)save:(id)sender;

@end


#pragma mark - Implementation
@implementation SMFDocumentDetailViewController

#pragma mark - Document Setter
- (void)setDocument:(SMFDocument *)document {
    _document = document;
    [self loadViewIfNeeded];
    self.title = self.document.title;
    self.wordCountLabel.text = [NSString.alloc initWithFormat:@"%i Words", self.document.wordCount];
    self.titleTextField.text = document.title;
    self.bodyTextView.text = document.body;
}

#pragma mark - Actions
- (IBAction)save:(id)sender {
    NSString *title = self.titleTextField.text;
    NSString *body = self.bodyTextView.text;
    if (self.document) {
        [self.documentController updateDocument:self.document title:title body:body];
    } else {
        [self.documentController createWithTitle:title body:body];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
