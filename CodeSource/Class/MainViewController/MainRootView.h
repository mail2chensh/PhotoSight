//
//  MainRootView.h
//  PhotoSight
//
//  Created by chensh on 15-3-5.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ViewType) {
    ViewType_Add = 1,
    ViewType_Show = 2
};

@interface MainRootView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *addButton;

@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, strong) UIButton *retryButton;

@property (nonatomic, assign) ViewType type;

@end
