//
//  ChatModel.h
//  testframework
//
//  Created by michael on 26/7/2016.
//  Copyright © 2016 michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatModel : NSObject



//用户名
@property (nonatomic,copy) NSString *username;
//介绍
@property (nonatomic,copy) NSString *introduction;
//头像图片路径
@property (nonatomic,copy) NSString *imagePath;


@end
