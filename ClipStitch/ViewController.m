//
//  ViewController.m
//  ClipStitch
//
//  Created by iApp on 07/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"
#import "AudioViewController.h"
#import "Define.h"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


@interface ViewController ()
{
    
  UIView *mainView;
  NSURL *videoUrl;
  UIView *playerView1;
  AVAsset *avAsset;
  //AVPlayer *avPlayer;
  AVPlayerItem *avPlayerItem;
  AVPlayerLayer *avPlayerLayer;
  NSMutableArray *urlArray;
  NSMutableArray *numberStoring;
    
    
     UIView *view1;
     UIView *view2;
     UIView *view3;
     UIView *view4;
     UIImageView *imageView1;
     UIImageView *imageView2;
     UIButton *playBtn1;
     int selectednumber;
     NSInteger i;
     Float64 duration;
     CMTime  time;
     UISlider *mySlider;
     UISlider  *mySlider2;
     UIButton *playBtn2;
     NSMutableArray * players;
     NSMutableArray *playerItems;
     UIButton *playBtn;
     UIButton *play;
    NSMutableArray *storingThubnails;
    CGRect theVideoRect;
    collageView1 *subView ;
    collageView2 *subView2;
    collageView3 *subView3;
    
}


@end

@implementation ViewController
@synthesize avPlayer,strImage;

- (void)viewDidLoad
{
   
    
[super viewDidLoad];
    
//   subView=[[collageView1 alloc]init];
//    subView.delegate=self;
  
storingThubnails=[[NSMutableArray alloc]init];
    
time= CMTimeMake(0, 1);
    
players=[[NSMutableArray alloc]init];
playerItems=[[NSMutableArray alloc]init];
imageView1=[[UIImageView alloc]init];
imageView2=[[UIImageView alloc]init];
    
    
mainView =[[UIView alloc]initWithFrame:CGRectMake(20, 40,self.view.frame.size.width-40,HEIGHT-200)];
mainView.backgroundColor=[UIColor lightGrayColor];
[self.view addSubview:mainView];
   
    
playBtn = [[UIButton alloc]initWithFrame:CGRectMake(20,CGRectGetMaxY(mainView.frame)+20,60,30)];
[playBtn setBackgroundColor:[UIColor redColor]];
[playBtn setTitle:@"play" forState:UIControlStateNormal];
playBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
[playBtn addTarget:self action:@selector(playMovie) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:playBtn];
    
    
    
   // view1
//     view1=[[UIView alloc]initWithFrame:CGRectMake(10,10,mainView.frame.size.width-20,mainView.frame.size.height-20)];
//    [view1 setBackgroundColor:[UIColor orangeColor]];
//    [mainView addSubview:view1];
    

  
    UIButton *pauseBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-80,CGRectGetMaxY(mainView.frame)+20,60,30)];
    pauseBtn.backgroundColor=[UIColor redColor];
    [pauseBtn setTitle:@"Stop" forState:UIControlStateNormal];
    pauseBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [pauseBtn addTarget:self action:@selector(stopVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseBtn];
    
    
    
    play = [[UIButton alloc]initWithFrame:CGRectMake(20,CGRectGetMaxY(mainView.frame)+20,60,30)];
    play.backgroundColor=[UIColor redColor];
    [play setTitle:@"play" forState:UIControlStateNormal];
    play.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [play addTarget:self action:@selector(playVideos) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:play];
    play.hidden=YES;
    
    
   // chooseFrameAction
    
    UIButton *chooseFrame = [[UIButton alloc]initWithFrame:CGRectMake(IS_IPHONE_5?70:90,CGRectGetMaxY(play.frame)+30,80,30)];
    chooseFrame.backgroundColor=[UIColor redColor];
    [chooseFrame setTitle:@"Frame" forState:UIControlStateNormal];
    chooseFrame.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [chooseFrame setContentMode:UIViewContentModeScaleAspectFill];
//    chooseFrame.layer.cornerRadius = chooseFrame.frame.size.width/2;
//    chooseFrame.layer.borderWidth = 2;
    [chooseFrame setClipsToBounds:YES];
    chooseFrame.layer.cornerRadius = 30/2;
    [chooseFrame addTarget:self action:@selector(chooseFrameAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseFrame];
    
    UIButton *chooseAudio = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(chooseFrame.frame)+20,CGRectGetMaxY(play.frame)+30,80,30)];
    chooseAudio.backgroundColor=[UIColor redColor];
    [chooseAudio setTitle:@"Audio" forState:UIControlStateNormal];
    chooseAudio.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [chooseAudio setContentMode:UIViewContentModeScaleAspectFill];
    chooseAudio.layer.cornerRadius = 30/2;
//    chooseAudio.layer.borderWidth = 2;
    [chooseAudio addTarget:self action:@selector(ChooseAudioAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseAudio];
    
    
    
//    collageView1 *subView = [[collageView1 alloc] initWithFrame:CGRectMake(0,0,mainView.frame.size.width,400)];
//    [mainView addSubview:subView];
    
   

}

- (void)chooseVideoAction
{
   NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
   NSNumber *sender= [userDefaults objectForKey:@"selectedButton"];
    
    
    
//    if ([sender isEqualToNumber:[NSNumber numberWithInt:0]])
//    {
        selectednumber=1;
   // }
//   else if (sender.tag==2)
//   {
//        selectednumber=2;
//   }
//   else if (sender.tag==3)
//   {
//        selectednumber=3;
//   }
//   else if (sender.tag==4)
//   {
//        selectednumber=4;
//   }
//   
    
    UIImagePickerController *imagePikerController = [[UIImagePickerController alloc] init];
    imagePikerController.delegate = self;
    imagePikerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePikerController.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, nil];
    [self presentViewController:imagePikerController animated:YES completion:NULL];
    
    
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
[avPlayer pause];
NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
if (CFStringCompare ((__bridge CFStringRef) mediaType, kUTTypeMovie, 0)== kCFCompareEqualTo)
    {
//NSString *moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
videoUrl=(NSURL*)[info objectForKey:UIImagePickerControllerMediaURL];
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    UIImage * image =   [self thumbnailImageFromURL:videoUrl];
   
    [storingThubnails addObject:image];
   
    if (selectednumber==1)
    {
    [imageView1 setFrame:CGRectMake(10,10 ,WIDTH-60, HEIGHT-220)];
    imageView1.image = image;
    }
    
    else if (selectednumber==2)
    {
        
    [imageView2 setFrame:CGRectMake(0,0,view2.frame.size.width,view2.frame.size.height)];
    imageView2.image = image;
        
    }
    
    if (selectednumber==1)
    {
        [subView addSubview:imageView1];
    }
    else if (selectednumber==2)
    {
        [view2 addSubview:imageView2];
    }
    [self storingUlrs];
    
}
-(void)storingUlrs
{
  
if (urlArray==nil)
    {
 urlArray=[[NSMutableArray alloc]init];
    }
 [urlArray addObject:videoUrl];
   }

-(void)playMovie
{
    
numberStoring =[[NSMutableArray alloc]init];
    
for ( i=0;i<urlArray.count;i++)
    {
        
[numberStoring addObject:[NSNumber numberWithInteger:i]];
NSLog(@"number::%@",[numberStoring objectAtIndex:i]);
[self playMovie:[urlArray objectAtIndex:i]];
        
    }
}

- (UIImage *)thumbnailImageFromURL:(NSURL *)videoURL
{
    
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    
    //  Get thumbnail at the very start of the video
    CMTime thumbnailTime = [asset duration];
    thumbnailTime.value = 0;
    
    //  Get image from the video at the given time
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    CGImageRef imageRef = [imageGenerator copyCGImageAtTime:thumbnailTime actualTime:NULL error:NULL];
    UIImage *thumbnail = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return thumbnail;
}


-(void)playMovie:(NSURL *)path
{
    
    [imageView1 removeFromSuperview];
    [imageView2 removeFromSuperview];
    
    avAsset = [AVAsset assetWithURL:path];
    avPlayerItem =[[AVPlayerItem alloc]initWithAsset:avAsset];
    
    avPlayer = [[AVPlayer alloc]initWithPlayerItem:avPlayerItem] ;

    avPlayerLayer =[AVPlayerLayer playerLayerWithPlayer:avPlayer];
    
   
    if ([[numberStoring objectAtIndex:i] isEqualToNumber:[NSNumber numberWithInteger:0]])
    {
    
        // avPlayerLayer.frame = subView.bounds;
        NSLog(@"%f%f",avPlayerLayer.frame.size.width,avPlayerLayer.frame.size.height);
       
      [avPlayerLayer setFrame:CGRectMake(10,10,subView.bounds.size.width-20,subView.bounds.size.height)];
         avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    else if ([[numberStoring objectAtIndex:i] isEqualToNumber:[NSNumber numberWithInteger:1]])
    {
    [avPlayerLayer setFrame:CGRectMake(0,0,view2.frame.size.width,view2.frame.size.height)];
    }
    if ([[numberStoring objectAtIndex:i] isEqualToNumber:[NSNumber numberWithInteger:0]])
    {
    [subView.layer addSublayer:avPlayerLayer];
    
   // view1.layer.needsDisplayOnBoundsChange=YES;
    }
    else if ([[numberStoring objectAtIndex:i] isEqualToNumber:[NSNumber numberWithInteger:1]])
    {
    [view2.layer addSublayer:avPlayerLayer];
    //subView.layer.needsDisplayOnBoundsChange=YES;
    }
    [avPlayer seekToTime:time];
    
    
//    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:[urlArray objectAtIndex:i] options:nil];
//    NSArray *audioTracks = [asset tracksWithMediaType:AVMediaTypeAudio];
//    
//    // Mute all the audio tracks
//    NSMutableArray *allAudioParams=[NSMutableArray array];
//    
//    for (AVAssetTrack *track in audioTracks)
//    {
//        AVMutableAudioMixInputParameters *audioInputParams =[AVMutableAudioMixInputParameters audioMixInputParameters];
//        [audioInputParams setVolume:99 atTime:kCMTimeZero];
//        [audioInputParams setTrackID:[track trackID]];
//        [allAudioParams addObject:audioInputParams];
//    }
//    
//    AVMutableAudioMix *audioZeroMix = [AVMutableAudioMix audioMix];
//    [audioZeroMix setInputParameters:allAudioParams];
//    
//    
//    AVPlayerItem *playerItem=[playerItems objectAtIndex:i];
//    [playerItem setAudioMix:audioZeroMix];
    
        ////
    //avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
   // avPlayerLayer.needsDisplayOnBoundsChange = YES;
    
       [avPlayer play];
    
     [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                             name:AVPlayerItemDidPlayToEndTimeNotification
                                             object:[avPlayer currentItem]];
  
       [players addObject:avPlayer];
       [playerItems addObject:[avPlayer currentItem]];
    
}





- (CGRect) videoRect
{
     theVideoRect = CGRectZero;
    
    // Replace this with whatever frame your AVPlayer is playing inside of:
    CGRect theLayerRect = subView.frame;
    
    //AVURLAsset *track =[asset tracksWithMediaType:AVMediaTypeVideo][0];
    AVURLAsset *track = [AVURLAsset URLAssetWithURL:[urlArray objectAtIndex:i] options:nil];
    CGSize theNaturalSize = [track naturalSize];
    theNaturalSize = CGSizeApplyAffineTransform(theNaturalSize, track.preferredTransform);
    theNaturalSize.width = fabs(theNaturalSize.width);
    theNaturalSize.height = fabs(theNaturalSize.height);
    
    CGFloat movieAspectRatio = theNaturalSize.width / theNaturalSize.height;
    CGFloat viewAspectRatio = theLayerRect.size.width / theLayerRect.size.height;
    
    // Note change this *greater than* to a *less than* if your video will play in aspect fit mode (as opposed to aspect fill mode)
    if (viewAspectRatio > movieAspectRatio)
    {
        theVideoRect.size.width = theLayerRect.size.width;
        theVideoRect.size.height = theLayerRect.size.width / movieAspectRatio;
        theVideoRect.origin.x = 0;
        theVideoRect.origin.y = (theLayerRect.size.height - theVideoRect.size.height) / 2;
    } else if (viewAspectRatio < movieAspectRatio)
    {
       // theVideoRect.size.width = movieAspectRatio * theLayerRect.size.height;
       theVideoRect.size.width = movieAspectRatio * theLayerRect.size.height;
        theVideoRect.size.height = theLayerRect.size.height;
        theVideoRect.origin.x = (theLayerRect.size.width - theVideoRect.size.width) / 2;
        theVideoRect.origin.y = 0;
    }
    
    return theVideoRect;
}


- (void)playerItemDidReachEnd:(NSNotification *)notification
{
    
  [avPlayer.currentItem seekToTime:kCMTimeZero];
  time=  CMTimeMake(0, 1);
   // [avPlayer play];
}



//-(void)stopMovie:(NSURL *)path
//{
//
// 
//     NSLog(@"%@",players);
//     NSLog(@"%lu",(unsigned long)players.count);
//    for (int k=0; k<[players count]; k++)
//    {
//        AVPlayer *player=[players objectAtIndex:k];
//        [player pause];
//        [player seekToTime:time];
//    }
//    
//}

- (CMTime)playerItemDuration
{
    
    AVPlayerItem *playerItem = [avPlayer currentItem];
    if (playerItem.status == AVPlayerItemStatusReadyToPlay)
    {
    return([playerItem duration]);
    }
    return(kCMTimeInvalid);
}

-(void)stopVideo
{
    playBtn.hidden=YES;
    play.hidden=NO;

    AVPlayerItem *item=avPlayer.currentItem;
    time = item.currentTime;

    
//    for ( i=0;i<urlArray.count;i++)
//    {
//    [self stopMovie:[urlArray objectAtIndex:i]];
//    }

    
    
    for (int k=0; k<[players count]; k++)
    {
        AVPlayer *player=[players objectAtIndex:k];
        [player pause];
        [player seekToTime:time];
    }
    
}

-(void)sliderChanged:(UISlider *)sender
{
   
    NSLog(@"%d",(int)sender.value);
    NSLog(@"%d",(int)sender.tag);
    
    
  //AVURLAsset *soundTrackAsset = [[AVURLAsset alloc]initWithURL:[urlArray objectAtIndex:0] options:nil];
  //AVMutableAudioMixInputParameters *audioInputParams = [AVMutableAudioMixInputParameters audioMixInputParameters];
    
   // [audioInputParams setVolume:0.5 atTime:kCMTimeZero];
  // [audioInputParams setTrackID:[[[soundTrackAsset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0]  trackID]];
  //  AVMutableAudioMix   *audioMix = [AVMutableAudioMix audioMix];
  //  audioMix.inputParameters = [NSArray arrayWithObject:audioInputParams];
    
    
   // AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:audioMix
                                                                     // presetName:AVAssetExportPresetHighestQuality];
    // exportSession.audioMix = audioMix;
    
    
    
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:[urlArray objectAtIndex:sender.tag] options:nil];
    NSArray *audioTracks = [asset tracksWithMediaType:AVMediaTypeAudio];
    
    // Mute all the audio tracks
    NSMutableArray *allAudioParams=[NSMutableArray array];
    
    for (AVAssetTrack *track in audioTracks)
    {
        AVMutableAudioMixInputParameters *audioInputParams =[AVMutableAudioMixInputParameters audioMixInputParameters];
        [audioInputParams setVolume:(int)sender.value atTime:kCMTimeZero];
        [audioInputParams setTrackID:[track trackID]];
        [allAudioParams addObject:audioInputParams];
    }
    
    
    AVMutableAudioMix *audioZeroMix = [AVMutableAudioMix audioMix];
    [audioZeroMix setInputParameters:allAudioParams];
    
   
    AVPlayerItem *playerItem=[playerItems objectAtIndex:sender.tag];
    [playerItem setAudioMix:audioZeroMix];
    
    
//    for (int k=0; k<[playerItems count]; k++)
//    {
//         AVPlayerItem *playerItem=[playerItems objectAtIndex:sender.tag];
//        
//        [playerItem setAudioMix:audioZeroMix];
//    }
  
    
    
    
}


-(void)playVideos
{
    for (int k=0; k<[players count]; k++)
    {
        AVPlayer *player=[players objectAtIndex:k];
        [player play];
        [player seekToTime:time];
    }
    
}


-(void)chooseFrameAction
{
    
CollectionViewController *collectionViewCon=[[CollectionViewController alloc]init];
[self presentViewController:collectionViewCon animated:NO completion:nil];
    
}

-(void)ChooseAudioAction
{
    
     AudioViewController *audioView=[[AudioViewController alloc]init];
     audioView.imagesArray=storingThubnails;
    [self presentViewController:audioView animated:NO completion:nil];
  
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    self.view.backgroundColor=[UIColor whiteColor];
    if ([[AppDelegate sharedDelegate].strClassName isEqualToString:@"AudioViewController"] )
    {
        
    NSLog(@"sliderValue::%@",self.sliderValue);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arrayOfSliderValues = [userDefaults objectForKey:@"sliderValuesArray"];
    
    NSLog(@"%@",arrayOfSliderValues);
        [self playMovie];
    
    for (int k=0; k<[urlArray count]; k++)
    {
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:[urlArray objectAtIndex:k] options:nil];
    NSArray *audioTracks = [asset tracksWithMediaType:AVMediaTypeAudio];
    
    // Mute all the audio tracks
    NSMutableArray *allAudioParams=[NSMutableArray array];
    
    for (AVAssetTrack *track in audioTracks)
    {
        AVMutableAudioMixInputParameters *audioInputParams =[AVMutableAudioMixInputParameters audioMixInputParameters];
        [audioInputParams setVolume:(int)[arrayOfSliderValues objectAtIndex:k] atTime:kCMTimeZero];
        [audioInputParams setTrackID:[track trackID]];
        [allAudioParams addObject:audioInputParams];
    }
    
    
    AVMutableAudioMix *audioZeroMix = [AVMutableAudioMix audioMix];
    [audioZeroMix setInputParameters:allAudioParams];
    
    
    AVPlayerItem *playerItem=[playerItems objectAtIndex:k];
    [playerItem setAudioMix:audioZeroMix];
     }
        
[AppDelegate sharedDelegate].strClassName = nil;
}
    
 else if ([[AppDelegate sharedDelegate].strClassName isEqualToString:@"CollectionViewController"])
 {
     [self frameSelection];
     
[AppDelegate sharedDelegate].strClassName = nil;
 }
 
 else if ([[AppDelegate sharedDelegate].strClassName isEqualToString:@"collageView1"])
 {
     //[self chooseVideoAction];
     [AppDelegate sharedDelegate].strClassName = nil;
 }
}

-(void)frameSelection
{
   // NSLog(@"%@",self.selectedFrameNumber);
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *selectedFrameNumber= [userDefaults objectForKey:@"selectedFrame"];
    NSLog(@"%@",selectedFrameNumber);
    
    if ([selectedFrameNumber isEqualToNumber:[NSNumber numberWithInt:0]])
        
         {
             
        [subView2 removeFromSuperview];
        [subView removeFromSuperview];
        [subView3 removeFromSuperview];
         subView = [[collageView1 alloc] initWithFrame:CGRectMake(0, 0,WIDTH-40,HEIGHT-220)];
         subView.delegate=self;
        [mainView addSubview:subView];
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"selectedFrame"];
             
             
        }
    
    else if ([selectedFrameNumber isEqualToNumber:[NSNumber numberWithInt:1]])
    {
        [subView2 removeFromSuperview];
        [subView removeFromSuperview];
        [subView3 removeFromSuperview];
        subView2 = [[collageView2 alloc] initWithFrame:CGRectMake(0, 0,315,367)];
        subView2.delegate=self;
        [mainView addSubview:subView2];
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"selectedFrame"];
        
    }
    else if ([selectedFrameNumber isEqualToNumber:[NSNumber numberWithInt:2]])
    {
        [subView2 removeFromSuperview];
        [subView removeFromSuperview];
        [subView3 removeFromSuperview];
        subView3 = [[collageView3 alloc] initWithFrame:CGRectMake(0, 0,315,367)];
        subView3.delegate=self;
        [mainView addSubview:subView3];
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"selectedFrame"];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
