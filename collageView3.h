//
//  collageView3.h
//  ClipStitch
//
//  Created by iApp on 13/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomViewDelegate3 <NSObject>

-(void)chooseVideoAction;

@end
@interface collageView3 : UIView
@property (nonatomic, assign) id <CustomViewDelegate3> delegate;
@end
