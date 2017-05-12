//
//  FRNoDataView.m
//  FRDemo
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import "FRNoDataView.h"
#import "UIColor+Category.h"

@implementation FRNoDataView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithHexColorString:@"f3f3f3"];
        
        CGFloat imageX = (frame.size.width-60)/2.0f;
        CGFloat imageY = (frame.size.width-100)/2.0f;
        _noDataImgView = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, 60, 60)];
        _noDataImgView.contentMode = UIViewContentModeCenter;
        _noDataImgView.image = [UIImage imageNamed:@"noActivityIcon.png"];
        [self addSubview:_noDataImgView];
        _noDataDescLab = [[UILabel alloc] initWithFrame:CGRectMake(0, imageY + 80, frame.size.width, 15)];
        _noDataDescLab.textAlignment = NSTextAlignmentCenter;
        _noDataDescLab.font = [UIFont systemFontOfSize:14];
        _noDataDescLab.textColor = [UIColor colorWithHexColorString:@"8C8E8F"];
        _noDataDescLab.text = @"此商家还未发布促销活动";
        [self addSubview:_noDataDescLab];
        
    }
    return self;
}


- (void)setNoDataViewImage:(NSString *)image text:(NSString *)text {
    
    [self.noDataImgView setImage:[UIImage imageNamed:image]];
    [self.noDataDescLab setText:text];
}

@end
