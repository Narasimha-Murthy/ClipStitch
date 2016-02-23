//
//  Define.h
//  ClipStitch
//
//  Created by Nagarjuna on 10/13/15.
//  Copyright © 2015 iApp. All rights reserved.
//

#ifndef Define_h
#define Define_h


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define KFontSizeHTML UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? @"22px" : @"20px"

#define kColorGreen [UIColor colorWithRed:107.0/255.0 green:196.0/255.0 blue:13.0/255.0 alpha:1.0]

#define kColorGrayTextfield [UIColor colorWithRed:34.0/255.0 green:34.0/255.0 blue:36.0/255.0 alpha:1.0]

#define HEIGHT    self.view.frame.size.height

#define WIDTH     self.view.frame.size.width



#endif /* Define_h */
