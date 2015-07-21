//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Rutan on 7/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()<UITextFieldDelegate>  //01.need a protocol reference

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
    
}



- (void)addScoreView:(NSInteger)index{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, index*44, 320, 44)];
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 160, CGRectGetHeight(view.frame))];
    name.placeholder = @"Enter Name";
    // 02.tag the textField, and make it its own delegate
    name.tag = 99;
    name.delegate = self;  //03.be sure to include the delegate protocol method somewhere below
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 60, CGRectGetHeight(view.frame))];
    score.text = @"0";
    
    UIStepper *button = [[UIStepper alloc] initWithFrame:CGRectMake(220, 10, 100, CGRectGetHeight(view.frame))];
    button.tintColor = [UIColor purpleColor];
    button.minimumValue = 0;
    button.maximumValue = 500000;
    button.stepValue = 100;
    button.tag = index;
    
    //04.put the target-action for the button here in the addScoreView method
    //(why???) (why not in the viewDidLoad method?)
    [button addTarget:self
               action:@selector(scoreStepperValueChanges:)
     forControlEvents:UIControlEventValueChanged];
    
    [view addSubview:name];
    [view addSubview:score];
    [view addSubview:button];
    [self.scrollView addSubview:view];
    
    [self.scoreLabels insertObject:score atIndex:index];
}
-(void)scoreStepperValueChanges:(id)sender {
    
    //05.why didn't this work? ::  UIStepper *button = (UIStepper *)[self.view viewWithTag:sender.tag];
    //in place of these lines:
    UIStepper *button = sender;
    NSInteger index = button.tag;
    double value = [button value];
    
    NSString* valueString = [NSString stringWithFormat:@"%d", (int)value]; //cast value as int
    UILabel *valueLabel = self.scoreLabels[index];
    valueLabel.text = valueString;
    

}

//06.UITextField Delegate method; since this is a protocol, the exact name and syntax of the method is given to us
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //07.removing the keyboard when user hits enter; just need to resign the First Responder
    [textField resignFirstResponder];
    return YES;
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
