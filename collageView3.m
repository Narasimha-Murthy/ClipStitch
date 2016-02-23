//
//  collageView3.m
//  ClipStitch
//
//  Created by iApp on 13/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import "collageView3.h"

@implementation collageView3

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
        UIView *singleView=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
        singleView.backgroundColor=[UIColor lightGrayColor];
        [self addSubview:singleView];
        
        UIView *collageView1=[[UIView alloc]initWithFrame:CGRectMake(10,10,self.frame.size.width,self.frame.size.height/2-20)];
        NSLog(@"%f%f",self.frame.size.width,self.frame.size.height);
        [collageView1 setBackgroundColor:[UIColor redColor]];
        [singleView  addSubview:collageView1];
        
        UIButton *addVideo = [[UIButton alloc]initWithFrame:CGRectMake(25,30,60,25)];
        [addVideo setTintColor:[UIColor lightGrayColor]];
        [addVideo setTitle:@"PickVideo" forState:UIControlStateNormal];
        addVideo.titleLabel.font = [UIFont systemFontOfSize:12.0];
        addVideo.tag=1;
        [addVideo addTarget:self.delegate action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [collageView1 addSubview:addVideo];
        
        
        
        UIView *collageView2=[[UIView alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(collageView1.frame)+10,self.frame.size.width,self.frame.size.height/2-20)];
        NSLog(@"%f%f",self.frame.size.width,self.frame.size.height);
        [collageView2 setBackgroundColor:[UIColor blackColor]];
        [singleView  addSubview:collageView2];
        
        
        UIButton *addVideo2 = [[UIButton alloc]initWithFrame:CGRectMake(25,30,60,25)];
        [addVideo2 setTintColor:[UIColor lightGrayColor]];
        [addVideo2 setTitle:@"PickVideo" forState:UIControlStateNormal];
        addVideo2.titleLabel.font = [UIFont systemFontOfSize:12.0];
        addVideo2.tag=1;
        [addVideo2 addTarget:self.delegate action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [collageView2 addSubview:addVideo2];
       
        
//        
//        UIView *collageView3=[[UIView alloc]initWithFrame:CGRectMake(164,20,self.frame.size.width/2-10,self.frame.size.height-20)];
//        NSLog(@"%f%f",self.frame.size.width,self.frame.size.height);
//        [collageView3 setBackgroundColor:[UIColor blackColor]];
//        [singleView  addSubview:collageView3];
//        
//        
//        UIButton *addVideo3 = [[UIButton alloc]initWithFrame:CGRectMake(25,30,60,25)];
//        [addVideo3 setTintColor:[UIColor lightGrayColor]];
//        [addVideo3 setTitle:@"PickVideo" forState:UIControlStateNormal];
//        addVideo3.titleLabel.font = [UIFont systemFontOfSize:12.0];
//        addVideo3.tag=1;
//        [addVideo3 addTarget:self.delegate action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
//        [collageView3 addSubview:addVideo3];

        
        
        
        
    }
    return self;
}


- (void)buttonTapped:(id)sender
{
    [self.delegate chooseVideoAction];
}







@end
