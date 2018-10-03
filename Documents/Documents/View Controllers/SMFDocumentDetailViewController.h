//
//  SMFDocumentDetailViewController.h
//  Documents
//
//  Created by Samantha Gatt on 10/3/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMFDocument;
@class SMFDocumentController;

NS_ASSUME_NONNULL_BEGIN

@interface SMFDocumentDetailViewController : UIViewController <UITextViewDelegate>

@property SMFDocumentController *documentController;
@property (nonatomic) SMFDocument *document;

@end

NS_ASSUME_NONNULL_END
