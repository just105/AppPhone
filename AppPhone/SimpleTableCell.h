//
//  SimpleTableCell.h
//  10-30練習text
//
//  Created by 張泓威 on 12/10/30.
//  Copyright (c) 2012年 張泓威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
//关亍前面的代码,weak 和 nonatomic 是 property 的特性。UILabel 和 UIImageView 是类型,nameLabel、prepTimeLabel和thumbnailImageView 是变量名称
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *telLabe;

@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@end
