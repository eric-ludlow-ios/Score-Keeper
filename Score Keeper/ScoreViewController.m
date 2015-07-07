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
@property (strong, nonatomic) NSMutableArray *scoreLabels;


@end



@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //initialize scrollView, add it to main view of ScoreViewController
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 1000);
    
    [self.view addSubview:self.scrollView];
    self.title = @"Awesome Score Keeper";
    
    self.scoreLabels = [NSMutableArray new];
    
    for (int i=0; i<4; i++) {
        [self addScoreView:i];
    }
    
    UIStepper *button = (UIStepper *)[self.view viewWithTag:index];
    [button addTarget:self
               action:@selector(scoreStepperValueChanges)
    forControlEvents:UIControlEventValueChanged];
    
}



- (void)addScoreView:(NSInteger)index{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, index*44, 320, 44)];
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 160, CGRectGetHeight(view.frame))];
    name.placeholder = @"Enter Name";
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 60, CGRectGetHeight(view.frame))];
    score.text = @"Score";
    
    UIStepper *button = [[UIStepper alloc] initWithFrame:CGRectMake(220, 10, 100, CGRectGetHeight(view.frame))];
    button.tintColor = [UIColor purpleColor];
    button.minimumValue = 0;
    button.maximumValue = 500000;
    button.stepValue = .01;
    button.tag = index;
    
    [view addSubview:name];
    [view addSubview:score];
    [view addSubview:button];
    [self.scrollView addSubview:view];
    
    [self.scoreLabels insertObject:score atIndex:index];
}
-(void)scoreStepperValueChanges {
    
    UIStepper *button = (UIStepper *)[self.view viewWithTag:index];
    NSString *valueString = button.value;
    UILabel *valueLabel = self.scoreLabels[index];
    valueLabel.text = valueString;
    

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
