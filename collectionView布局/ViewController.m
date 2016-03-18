//
//  ViewController.m
//  collectionView布局
//
//  Created by qiu on 16/1/29.
//  Copyright © 2016年 qiu. All rights reserved.
//

#import "ViewController.h"
//水平布局
#import "SQLineLayout.h"
#import "SQPhotoCell.h"
//格子布局
#import "SQGridLayout.h"
#import "SQPhotoCollectionViewCell.h"
#define SQCellId @"SQCell"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //水平布局
    SQLineLayout *layout = [[SQLineLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(100, 100);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 200) collectionViewLayout:layout];

//    SQGridLayout *layout = [[SQGridLayout alloc]init];
//    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource= self;
//    UINib *nib = [UINib nibWithNibName:@"SQPhotoCell" bundle:nil];
//    [collectionView registerNib:nib forCellWithReuseIdentifier:SQCellId];
    [collectionView registerClass:[SQPhotoCollectionViewCell class] forCellWithReuseIdentifier:SQCellId];;
    [self.view addSubview:collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 13;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SQPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SQCellId forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"%ld.jpg",indexPath.item + 1];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
}

@end
