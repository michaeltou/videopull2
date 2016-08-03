//
//  GiftViewController.h
//  testframework
//
//  Created by michael on 19/7/2016.
//  Copyright © 2016 michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *giftName;

@property (weak, nonatomic) IBOutlet UIImageView *giftImage;

- (IBAction)SendGift:(id)sender;

@end
