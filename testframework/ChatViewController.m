//
//  ChatViewController.m
//  testframework
//
//  Created by michael on 26/7/2016.
//  Copyright © 2016 michael. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatTableViewCell.h"
#import "ChatModel.h"


@interface ChatViewController ()


@property (strong,nonatomic) NSMutableArray *chatTableData;  //tableView数据存放数组


@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _chatTableData = [[NSMutableArray alloc] init];
    [self createChatData];
    
    
//    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];

    _chatTableView.delegate = self;
    _chatTableView.dataSource = self;

}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //取消键盘输入
     [self.view endEditing:YES];  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *TableSampleIdentifier = @"myTableView";
    
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                               TableSampleIdentifier];
    
    
    if (cell == nil) {
        cell = [[ChatTableViewCell alloc] initWithReuseIdentifier:TableSampleIdentifier];
    }
    
    
    ChatModel *chat = [_chatTableData objectAtIndex:indexPath.row];
    cell.name.text = chat.username;
    [cell.userImage setImage:[UIImage imageNamed:chat.imagePath]];
    [cell setIntroductionText:chat.introduction];
    return cell;
    
}



//我需要一点测试数据，直接复制老项目东西
-(void)createChatData{
    ChatModel *user = [[ChatModel alloc] init];
    [user setUsername:@"胖虎"];
    [user setIntroduction:@"我是胖虎我怕谁!!我是胖虎我怕谁!!我是胖虎我怕谁!!"];
    [user setImagePath:@"closebtn"];
    ChatModel *user2 = [[ChatModel alloc] init];
    [user2 setUsername:@"多啦A梦"];
    [user2 setIntroduction:@"我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!我是多啦A梦我有肚子!!"];
    [user2 setImagePath:@"giftbtn"];
    ChatModel *user3 = [[ChatModel alloc] init];
    [user3 setUsername:@"大雄"];
    [user3 setIntroduction:@"我是大雄我谁都怕，我是大雄我谁都怕，我是大雄我谁都怕，我是大雄我谁都怕，我是大雄我谁都怕，我是大雄我谁都怕，"];
    [user3 setImagePath:@"giftbtn"];
    
    
    [_chatTableData addObject:user];
    [_chatTableData addObject:user2];
    [_chatTableData addObject:user3];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_chatTableData count];
}

@end
