//
//  ViewController.m
//  UICollectionViewController
//
//  Created by mac373 on 16/2/3.
//  Copyright © 2016年 ole. All rights reserved.
//

#import "ViewController.h"

#define WEIGHT [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- setup
-(void)setup{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc ]init];
    
    UICollectionView *first=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,WEIGHT ,HEIGHT) collectionViewLayout:flowLayout];
    /*
     *  注册cell
     */
    [first registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:first];
    first.dataSource=self;
    first.delegate=self;
}

#pragma mark- Source Delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"cell";
    //    UICollectionViewCell *cell=[[UICollectionViewCell alloc] init];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.contentView.backgroundColor=[UIColor whiteColor];
    
    return cell;
}
#pragma mark- FlowDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(WEIGHT/3, WEIGHT/3);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return WEIGHT/9;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    return UIEdgeInsetsMake(WEIGHT/18, WEIGHT/9, WEIGHT/18, WEIGHT/9);
}

@end
