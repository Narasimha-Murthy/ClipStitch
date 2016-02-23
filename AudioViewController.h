//
//  AudioViewController.h
//  ClipStitch
//
//  Created by iApp on 12/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AudioViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *SongArray;
}
@property(nonatomic,retain)NSMutableArray *imagesArray;
@end
