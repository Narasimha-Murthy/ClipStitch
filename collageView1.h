//
//  collageView1.h
//  ClipStitch
//
//  Created by iApp on 13/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomViewDelegate <NSObject>

-(void)chooseVideoAction;

//-(CGRect)sendingFrameValue;

@end


@interface collageView1 : UIView<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, assign) id <CustomViewDelegate> delegate;


@property(strong,nonatomic)UIButton *playBtn1;



@end
