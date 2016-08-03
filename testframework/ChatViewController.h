//
//  ChatViewController.h
//  testframework
//
//  Created by michael on 26/7/2016.
//  Copyright © 2016 michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;


@end
