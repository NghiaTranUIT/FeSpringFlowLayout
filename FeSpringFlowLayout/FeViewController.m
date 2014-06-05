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
    
    return cell;
}
@end
