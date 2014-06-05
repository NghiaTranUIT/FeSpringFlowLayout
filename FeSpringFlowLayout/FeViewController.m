//
//  FeViewController.m
//  FeSpringFlowLayout
//
//  Created by Nghia Tran on 6/5/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeViewController.h"
#import "FeSpringFlowLayout.h"
#define kFe_Cell_ID @"cell"

@interface FeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) FeSpringFlowLayout *springFlowLayout;

//////////
-(void) initCommon;
-(void) initSpringFlowLayout;
-(void) initCollectionView;
@end

@implementation FeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initCommon];
    
    [self initSpringFlowLayout];
    
    [self initCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init
-(void) initCommon
{
    
}
-(void) initSpringFlowLayout
{
    _springFlowLayout = [[FeSpringFlowLayout alloc] init];
}
-(void) initCollectionView
{
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_springFlowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kFe_Cell_ID];
    [self.view addSubview:_collectionView];
}

#pragma mark - UICollection View Delegate - Data source
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:kFe_Cell_ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    
    // Set color
    UIColor *color = [self colorGradientBetweenColor:[UIColor redColor] secondColor:[UIColor yellowColor] atRow:indexPath.row];
    cell.backgroundColor = color;
    
    return cell;
}

#pragma mark - Color
-(UIColor *) colorGradientBetweenColor:(UIColor *) firstColor secondColor:(UIColor * ) secondColor atRow:(NSInteger)row
{
    /*
    public static String progressiveColor(int value, int all){
        
        int red = 255 - (int)((float)(value*255)/(float)all);
        int green = (int)((float)(value*255)/(float)all);
        return String.format("#%06X", (0xFFFFFF & Color.argb(255, red, green, 0)));
        
    }
      */
    NSInteger value = row;
    NSInteger all = 30;
    
    int red = 255 - (int)((float)(value*255)/(float)all);
    int green = (int)((float)(value*255)/(float)all);
    
    return [UIColor colorWithRed:(float)red / 255.0f green:(float)green / 255.0f blue:0 alpha:1];
}
@end
