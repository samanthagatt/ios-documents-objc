//
//  SMFDocumentDetailViewController.m
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import "SMFDocumentDetailViewController.h"
#import "SMFDocumentCD+CoreDataClass.h"
#import "SMFDocumentController.h"
#import "NSString+SMFWordCount.h"


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

#pragma mark - ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bodyTextView.delegate = self;
}

#pragma mark - Document Property Setter
- (void)setDocument:(SMFDocumentCD *)document {
    _document = document;
    [self loadViewIfNeeded];
    self.title = self.document.title;
    self.wordCountLabel.text = [NSString.alloc initWithFormat:@"%i Words", [self.document.body wordCount]];
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

#pragma mark - UITextView Delegate
- (void)textViewDidChange:(UITextView *)textView {
    int wordCount = self.bodyTextView.text.wordCount;
    self.wordCountLabel.text = [[NSString alloc] initWithFormat:@"%i Words", wordCount];
}

@end
