//
//  collageView1.m
//  ClipStitch
//
//  Created by iApp on 13/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import "collageView1.h"
#import "ViewController.h"

@implementation collageView1
{
   int selectednumber;
    NSURL *videoUrl;
    UIView *collage1;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize playBtn1;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
   
        [AppDelegate sharedDelegate].strClassName = @"collageView1";
        
        collage1=[[UIView alloc]initWithFrame:CGRectMake(10,10,self.frame.size.width-20,self.frame.size.height)];
         NSLog(@"%f%f",self.frame.size.width,self.frame.size.height);
         [collage1 setBackgroundColor:[UIColor blackColor]];
            [self  addSubview:collage1];
      
        
            playBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2-30,self.frame.size.height/2-13,60,25)];
            [playBtn1 setTintColor:[UIColor redColor]];
            [playBtn1 setTitle:@"PickVideo" forState:UIControlStateNormal];
            playBtn1.titleLabel.font = [UIFont systemFontOfSize:12.0];
            playBtn1.tag=0;
      
          [playBtn1 addTarget:self.delegate action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(buttonTapped:)];
        [collage1 addGestureRecognizer:singleFingerTap];
     
        
        //The event handling method
//        - (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
//        {
//            CGPoint location = [recognizer locationInView:[recognizer.view superview]];
//            
//            //Do stuff here...
//        }
        
        
        
        
        
        
          [collage1 addSubview:playBtn1];
        
         }
    
    return self;
}



//- (void)drawRect:(CGRect)rect
//{
//
//    CGContextRef context=UIGraphicsGetCurrentContext();
//    CGRect myFrame=self.bounds;
//    CGContextSetLineWidth(context, 10);
//    CGRectInset(myFrame, 5, 5);
//    [[UIColor greenColor]set];
//    UIRectFrame(myFrame);
//    
//}






- (void)buttonTapped:(id)sender
{
  
[self.delegate chooseVideoAction];

    
}




//-(void)chooseVideoAction:(UIButton *)sender
//{
//    UIButton *btn=sender;
//    NSUserDefaults *userDefaults =[NSUserDefaults standardUserDefaults];
//    [userDefaults setObject:[NSNumber numberWithInt:(int)btn.tag] forKey:@"selectedButton"];
//    [userDefaults synchronize];
//   
//    ViewController *viewObj=[[ViewController alloc]init];
//    //[viewObj chooseVideoAction];
//    [(ViewController *)[self.superview nextResponder] presentViewController:viewObj animated:YES completion:nil];
//    
//    
//    
//    
//}


@end
