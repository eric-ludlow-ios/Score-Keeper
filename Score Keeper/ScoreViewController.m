//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Rutan on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;


@end



@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //initialize scrollView, add it to main view of ScoreViewController
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [self.view addSubview:scrollView];
    self.title = @"Awesome Score Keeper";
    
    
    
    
    
    
}

- (void)addScoreView {
    UIView *view = [UIView new];
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 160, CGRectGetHeight(self.view.frame))];
    name.placeholder = @"Enter Name";
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 80, CGRectGetHeight(self.view.frame))];
    score.text = @"Score";
    UIStepper *button = [[UIStepper alloc] initWithFrame:CGRectMake(240, 0, 80, CGRectGetHeight(self.view.frame))];
    
    [self.view addSubview:name];
    [self.view addSubview:score];
    [self.view addSubview:button];
    [self.scrollView addSubview:view];
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
