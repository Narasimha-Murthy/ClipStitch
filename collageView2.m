//
//  collageView2.m
//  ClipStitch
//
//  Created by iApp on 13/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import "collageView2.h"

@implementation collageView2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
        UIView *singleView=[[UIView alloc]initWithFrame:CGRectMake(10,10,self.frame.size.width-55,self.frame.size.height-20)];
        singleView.backgroundColor=[UIColor clearColor];
        [self addSubview:singleView];
        
         UIView *collage1=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width/2-33,self.frame.size.height-20)];
         NSLog(@"%f%f",self.frame.size.width,self.frame.size.height);
         [collage1 setBackgroundColor:[UIColor redColor]];
         [singleView  addSubview:collage1];
        
        
        UIButton *addVideo = [[UIButton alloc]initWithFrame:CGRectMake(25,30,60,25)];
        [addVideo setTintColor:[UIColor lightGrayColor]];
        [addVideo setTitle:@"PickVideo" forState:UIControlStateNormal];
        addVideo.titleLabel.font = [UIFont systemFontOfSize:12.0];
        addVideo.tag=1;
        [addVideo addTarget:self.delegate action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [collage1 addSubview:addVideo];
        
         
        UIView *collage2=[[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(collage1.frame)+10,0,self.frame.size.width/2-33,self.frame.size.height-20)];
        NSLog(@"%f%f",self.frame.size.width,self.frame.size.height);
        [collage2 setBackgroundColor:[UIColor blackColor]];
        [singleView  addSubview:collage2];
        

        UIButton *addVideo2 = [[UIButton alloc]initWithFrame:CGRectMake(25,30,60,25)];
        [addVideo2 setTintColor:[UIColor lightGrayColor]];
        [addVideo2 setTitle:@"PickVideo" forState:UIControlStateNormal];
         addVideo2.titleLabel.font = [UIFont systemFontOfSize:12.0];
         addVideo2.tag=1;
        [addVideo2 addTarget:self.delegate action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [collage2 addSubview:addVideo2];
        
    
    }
    return self;
}



- (void)buttonTapped:(id)sender
{
    [self.delegate chooseVideoAction];
}



@end
