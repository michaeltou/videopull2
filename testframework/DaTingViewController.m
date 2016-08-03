//
//  DaTingViewController.m
//  testframework
//
//  Created by michael on 31/7/2016.
//  Copyright © 2016 michael. All rights reserved.
//

#import "DaTingViewController.h"

@interface DaTingViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *myNavigationItem;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation DaTingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"DaTing view is loaeded");
    
    
    // 1.创建UIScrollView
    /* UIScrollView *scrollView = [[UIScrollView alloc] init];
     scrollView.frame = CGRectMake(0, 0, 250, 250); // frame中的size指UIScrollView的可视范围
     scrollView.backgroundColor = [UIColor grayColor];
     [self.view addSubview:scrollView];
     
     */
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"bigimage"];
    CGFloat imgW = imageView.image.size.width; // 图片的宽度
    CGFloat imgH = imageView.image.size.height; // 图片的高度
    imageView.frame = CGRectMake(0, 0, imgW, imgH);
    [_myScrollView addSubview:imageView];
    
    // 3.设置scrollView的属性
    
    // 设置UIScrollView的滚动范围（内容大小）
    _myScrollView.contentSize = imageView.image.size;
    
    //分页滑动
    _myScrollView.pagingEnabled = TRUE;
    //滚动方向锁定
    _myScrollView.directionalLockEnabled = TRUE;
    _myScrollView.alwaysBounceVertical = NO;
    _myScrollView.alwaysBounceHorizontal = NO;
    _myScrollView.bounces =FALSE;
    // 隐藏水平滚动条
    _myScrollView.showsHorizontalScrollIndicator = NO;
    _myScrollView.showsVerticalScrollIndicator = NO;
    
    
    
    
    // 用来记录scrollview滚动的位置
    //    scrollView.contentOffset = ;
    
    // 去掉弹簧效果
    //    scrollView.bounces = NO;
    
    // 增加额外的滚动区域（逆时针，上、左、下、右）
    // top  left  bottom  right
    // _myScrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    
    
    NSArray *array=@[@"关注",@"推荐",@"所有"];
    UISegmentedControl *segmentControl=[[UISegmentedControl alloc]initWithItems:array];
    // segmentControl.segmentedControlStyle=UISegmentedControlStyleBezeled;
    //设置位置 大小
    segmentControl.frame=CGRectMake(60, 100, 200, 40);
    //默认选择
    segmentControl.selectedSegmentIndex=1;
    //设置背景色
    segmentControl.tintColor=[UIColor greenColor];
    //设置监听事件
    [segmentControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    // [self.view addSubview:segmentControl];
    
    
    
    segmentControl.tintColor = [UIColor clearColor];//去掉颜色,现在整个segment都看不见
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                             NSForegroundColorAttributeName: [UIColor greenColor]};
    [segmentControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                               NSForegroundColorAttributeName: [UIColor redColor]};
    [segmentControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    
    self.myNavigationItem.titleView = segmentControl;//添加到导航栏
    
    
    
}




-(void)change:(UISegmentedControl *)segmentControl{
    NSLog(@"segmentControl %d",segmentControl.selectedSegmentIndex);
    
    
    //获取当前视图的页码
    CGRect rect = self.myScrollView.frame;
    //设置视图的横坐标，一幅图为320*460，横坐标一次增加或减少320像素
    rect.origin.x = segmentControl.selectedSegmentIndex * self.myScrollView.frame.size.width;
    //设置视图纵坐标为0
    // rect.origin.y = 0;
    rect.origin.y = _myScrollView.contentOffset.y;
    
    //scrollView可视区域
    [self.myScrollView scrollRectToVisible:rect animated:YES];
    
    
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

@end
