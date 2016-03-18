//
//  SQGridLayout.m
//  collectionView布局
//
//  Created by qiu on 16/1/29.
//  Copyright © 2016年 qiu. All rights reserved.
//

#import "SQGridLayout.h"
@interface SQGridLayout()

/**
 *  所有的布局属性
 */
@property(nonatomic,strong)NSMutableArray *attrsArray;

@end

@implementation SQGridLayout

-(NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [[NSMutableArray alloc]init];
    }
    return _attrsArray;
}

-(void)prepareLayout
{
    [super prepareLayout];
    
    [self.attrsArray removeLastObject];
    
    NSInteger count =[self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        //创建UIcollectionViewLayoutattributes
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        //设置布局属性
        CGFloat width = self.collectionView.frame.size.width * 0.5;
        if (i == 0 ) {
            CGFloat height = width;
            CGFloat x = 0;
            CGFloat y = 0;
            attrs.frame = CGRectMake(x, y, width, height);

        }else if(i == 1){
            CGFloat height = width * 0.5;
            CGFloat x = width;
            CGFloat y = 0;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if(i == 2){
            CGFloat height = width * 0.5;
            CGFloat x  = width;
            CGFloat y = height;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if(i == 3){
            CGFloat height = width * 0.5;
            CGFloat x = 0;
            CGFloat y = width;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if (i == 4){
            CGFloat height = width * 0.5;
            CGFloat x = 0;
            CGFloat y = width + height;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if(i == 5){
            CGFloat height = width;
            CGFloat x = width;
            CGFloat y = width;
            attrs.frame = CGRectMake(x, y, width, height);
        }else{
            UICollectionViewLayoutAttributes *lastAttrs = self.attrsArray[i - 6];
            CGRect lastFrame = lastAttrs.frame;
            lastFrame.origin.y += 2 * width;
            attrs.frame = lastFrame;
        }
        [self.attrsArray addObject:attrs];
    }
}

-(CGSize)collectionViewContentSize
{
    int count = (int)[self.collectionView numberOfItemsInSection:0];
    int rows = (count+ 3 - 1)/ 3 ;
    CGFloat rowH = self.collectionView.frame.size.width * 0.5;
    return CGSizeMake(0, rowH *rows);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
