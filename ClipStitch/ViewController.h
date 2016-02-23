//
//  ViewController.h
//  ClipStitch
//
//  Created by iApp on 07/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"
#import "collageView1.h"
#import "collageView2.h"
#import "collageView3.h"


@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,CustomViewDelegate,CustomViewDelegate2,CustomViewDelegate3>


@property (strong, nonatomic) AVPlayer *avPlayer;
@property(strong,nonatomic) NSNumber  *sliderValue;
@property(strong,nonatomic) NSString  *strImage;
@property(strong,nonatomic) NSNumber  *selectedFrameNumber;
-(void)frameSelection;
- (void)chooseVideoAction;
//@property(strong,nonatomic)UIButton *playBtn1;
@end

