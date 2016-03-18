//
//  SQPhotoCell.h
//  collectionView布局
//
//  Created by qiu on 16/1/29.
//  Copyright © 2016年 qiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQPhotoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photo;



@property(nonatomic,copy)NSString *imageName;

@end
