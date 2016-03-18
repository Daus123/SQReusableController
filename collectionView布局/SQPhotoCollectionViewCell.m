//
//  SQPhotoCollectionViewCell.m
//  collectionView布局
//
//  Created by qiu on 16/2/1.
//  Copyright © 2016年 qiu. All rights reserved.
//

#import "SQPhotoCollectionViewCell.h"

@implementation SQPhotoCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.photo = [[UIImageView alloc]initWithFrame:frame];
        self.photo.layer.borderColor = [UIColor whiteColor].CGColor;
        self.photo.layer.borderWidth = 10;
        [self.contentView addSubview:self.photo];
    }
    return self;
}

-(void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.photo.image = [UIImage imageNamed:imageName];

}




@end
