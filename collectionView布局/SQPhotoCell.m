//
//  SQPhotoCell.m
//  collectionView布局
//
//  Created by qiu on 16/1/29.
//  Copyright © 2016年 qiu. All rights reserved.
//

#import "SQPhotoCell.h"

@implementation SQPhotoCell

- (void)awakeFromNib {
    
    self.photo.layer.borderColor = [UIColor whiteColor].CGColor;
    self.photo.layer.borderWidth = 10;
    
}

-(void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.photo.image = [UIImage imageNamed:imageName];
}

@end
