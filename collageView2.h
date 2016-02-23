//
//  collageView2.h
//  ClipStitch
//
//  Created by iApp on 13/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomViewDelegate2 <NSObject>

-(void)chooseVideoAction;

@end

@interface collageView2 : UIView

@property (nonatomic, assign) id <CustomViewDelegate2> delegate;

@end
