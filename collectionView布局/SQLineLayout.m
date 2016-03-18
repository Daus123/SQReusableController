//
//  SQLineLayout.m
//  collectionView布局
//
//  Created by qiu on 16/1/29.
//  Copyright © 2016年 qiu. All rights reserved.
//

#import "SQLineLayout.h"

@implementation SQLineLayout


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //在superi 已经算好的基础上，再去做一些改进
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    //计算collectionView最中心的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width*0.5;
    
    //
    for (UICollectionViewLayoutAttributes *attrs in array) {
        //cell中心x和collectionx的值的间距
        CGFloat delta = ABS(attrs.center.x - centerX);
        //根据间距计算celld缩放比例
        CGFloat scale = 1 - delta / self.collectionView.frame.size.width;
        
        attrs.transform  = CGAffineTransformMakeScale(scale, scale);
        
    }
    
    
    return array;
}

//当collectionView的显示范围发生改变是否需要重新刷新布局 1.prepareLayout  2.layoutAttributesForElementsInRect:
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

//cell即将停止滚动的时候,collectionView停止滚动时的偏移量
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{

    //计算出最终显示的矩形框
    CGRect rect ;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    //计算collection最中心x值
    CGFloat centerX = ABS(proposedContentOffset.x + self.collectionView.frame.size.width * 0.5);
    CGFloat minDelta = MAXFLOAT;
    //存放最小的间距值
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(minDelta) > ABS(attrs.center.x - centerX) ) {
            minDelta = attrs.center.x - centerX;
            NSLog(@"minDelta = %f",minDelta);
        }
    }
    //修改原有偏移量
    proposedContentOffset.x += minDelta;

    return proposedContentOffset;
}

/**
 * 用来做布局的初始化操作（不建议在init方法中进行布局的初始化操作--可能布局还未加到View中去，就会返回为空）
 */
-(void)prepareLayout
{
    [super prepareLayout];
    
    //设置内边距
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
}
@end
