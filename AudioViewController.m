//
//  AudioViewController.m
//  ClipStitch
//
//  Created by iApp on 12/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import "AudioViewController.h"

@interface AudioViewController ()
{
    
NSMutableArray *sliderValues;
UITableView *audioTableView;
    
}
@end

@implementation AudioViewController

@synthesize imagesArray;

- (void)viewDidLoad
{
    
    
[super viewDidLoad];
    
   [AppDelegate sharedDelegate].strClassName = @"AudioViewController";
    
    NSLog(@"%@",imagesArray);
    sliderValues=[[NSMutableArray alloc]init];
    self.view.backgroundColor=[UIColor whiteColor];
    audioTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,54,self.view.frame.size.width,self.view.frame.size.height-54)];
    audioTableView.delegate=self;
    audioTableView.dataSource=self;
    [self.view addSubview:audioTableView];
    
   
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,54)];
    view.backgroundColor=[UIColor redColor];
    [self.view addSubview:view];
 
    
    UIButton *DoneBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-100,20,50,25)];
    DoneBtn.backgroundColor=[UIColor redColor];
    [DoneBtn setTitle:@"Done" forState:UIControlStateNormal];
    DoneBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [DoneBtn addTarget:self action:@selector(DoneBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:DoneBtn];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return imagesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    UISlider  *theSlider =  [[UISlider alloc] initWithFrame:CGRectMake(0,12,150,23)];
    theSlider.maximumValue=99;
    theSlider.minimumValue=0;
    theSlider.continuous=NO;
    theSlider.value=100;
    theSlider.tag=0;
    [cell addSubview:theSlider];
     cell.accessoryView = theSlider;
    cell.imageView.image=[imagesArray objectAtIndex:0];
    
[(UISlider *)cell.accessoryView addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    return cell;
    
}

-(void)sliderValueChange:(UISlider *)sender
{
    
    
    if (sender.tag==0)
    {
       
ViewController *obj=[[ViewController alloc]init];
obj.sliderValue=[NSNumber numberWithFloat:sender.tag];
[sliderValues addObject:[NSNumber numberWithFloat:sender.value]];
   }

    
    NSUserDefaults *userDefaults =[NSUserDefaults standardUserDefaults];
    [userDefaults setObject:sliderValues forKey:@"sliderValuesArray"];
    [userDefaults synchronize];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)DoneBtnAction
{
 
    ViewController *obj=[[ViewController alloc]init];
    [self presentViewController:obj animated:NO completion:nil];
    
    
}




@end
