//
//  FRNoDataView.h
//  FRDemo
//
//  Created by mac on 2017/5/10.
//  Copyright © 2017年 QuFanrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRNoDataView : UIView

@property (strong, nonatomic) UIImageView *noDataImgView;
@property (strong, nonatomic) UILabel *noDataDescLab;

- (void)setNoDataViewImage:(NSString *)image text:(NSString *)text;

@end
