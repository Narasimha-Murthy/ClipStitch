//
//  AppDelegate.h
//  ClipStitch
//
//  Created by iApp on 07/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSString *strClassName;
+(AppDelegate *)sharedDelegate;
@end

