//
//  CollectionViewController.m
//  ClipStitch
//
//  Created by iApp on 08/10/15.
//  Copyright (c) 2015 iApp. All rights reserved.
//

#import "CollectionViewController.h"
#import "ViewController.h"

@interface CollectionViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *firstPng;
@end

@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create data for collection views
    
    [AppDelegate sharedDelegate].strClassName = @"CollectionViewController";
    
    
    self.navigationController.navigationBar.backgroundColor=[UIColor redColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView.backgroundColor=[UIColor whiteColor];
    NSMutableArray *firstSection = [[NSMutableArray alloc] init];
    NSMutableArray *secondSection = [[NSMutableArray alloc] init];
    
    
    self.firstPng =[[NSArray alloc]initWithObjects:@"collage1",@"collage2",@"collage3", @"collage4", @"collage5", @"collage6", @"collage7", @"collage8", nil];
    
    
    for (int i=0; i<50; i++)
    {
        [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
        [secondSection addObject:[NSString stringWithFormat:@"item %d", i]];
    }
    
    self.dataArray = [[NSArray alloc] initWithObjects:firstSection, secondSection, nil];
    
     //Uncomment this block to use nib-based cells
    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    // end of nib-based cells block
    
    /* uncomment this block to use subclassed cells */
   // [self.collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:@"cvCell"];
    /* end of subclass-based cells block */
    
    // Configure layout
    
    [flowLayout setItemSize:CGSizeMake(125, 120)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.collectionView setCollectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];
    // Do any additional setup after loading the view from its nib.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
  //  NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    return 8;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Setup cell identifier
    static NSString *cellIdentifier = @"cvCell";
    
    /*  Uncomment this block to use nib-based cells */
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 125, 120)];
    imv.image=[UIImage imageNamed:[self.firstPng objectAtIndex:indexPath.row]];
    [cell addSubview:imv];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    //if (indexPath.row==0)
  //  {
       
        //ViewController *collageView1=[[ViewController alloc]init];
        NSUserDefaults *userDefaults =[NSUserDefaults standardUserDefaults];
        [userDefaults setObject:[NSNumber numberWithInt:(int)indexPath.row] forKey:@"selectedFrame"];
        [userDefaults synchronize];
        
        NSLog(@"%@",[NSNumber numberWithInt:(int)indexPath.row]);
       //[collageView1 frameSelection];
        [self dismissViewControllerAnimated:NO completion:nil];
        
        
  //  }

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
