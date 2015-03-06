//
//  MainRootView.m
//  PhotoSight
//
//  Created by chensh on 15-3-5.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "MainRootView.h"


#define MarginOfChooseImageView 10.0f


@implementation MainRootView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    _type = ViewType_Add;
    //
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, HeightOfNavicontroller + HeightOfStatusBar, ScreenWidth, ScreenHeight - HeightOfStatusBar - HeightOfNavicontroller)];
    [self addSubview:_scrollView];
    //
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(MarginOfChooseImageView, MarginOfChooseImageView * 2, (ScreenWidth - MarginOfChooseImageView * 2), (ScreenWidth - MarginOfChooseImageView * 2))];
    _imageView.userInteractionEnabled = YES;
    _imageView.layer.cornerRadius = 5.0f;
    _imageView.layer.masksToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_imageView];
    _imageView.backgroundColor = [UIColor redColor];
    //
    UIImage *btnImg = [UIImage imageNamed:@"button_add.png"];
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setBackgroundImage:btnImg forState:UIControlStateNormal];
    _addButton.frame = _imageView.frame;
    [_scrollView addSubview:_addButton];
    
    //
    _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(MarginOfChooseImageView * 2, _addButton.bottom + MarginOfChooseImageView * 2, (ScreenWidth - MarginOfChooseImageView * 4), 50.0f)];
    _descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _descLabel.numberOfLines = 0;
    [_scrollView addSubview:_descLabel];
    
    //
    _retryButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_retryButton setTitle:@"重选图片" forState:UIControlStateNormal];
    _retryButton.frame = CGRectMake(MarginOfChooseImageView, _descLabel.bottom + MarginOfChooseImageView * 2, (ScreenWidth - MarginOfChooseImageView * 2), 40.0f) ;
    //

}


- (void)layoutSelfView
{
    if (_type == ViewType_Add) {
        _imageView.hidden = YES;
        _addButton.hidden = NO;
        _retryButton.hidden = YES;
        
        _descLabel.text = @"";
    } else {
        _imageView.hidden = NO;
        _addButton.hidden = YES;
        _retryButton.hidden = NO;
    }
    
    [_descLabel sizeToFit];
    _descLabel.frame = CGRectMake(_descLabel.left, _descLabel.top, _descLabel.width, _descLabel.height);
    _retryButton.frame = CGRectMake(MarginOfChooseImageView, _descLabel.bottom + MarginOfChooseImageView * 2, (ScreenWidth - MarginOfChooseImageView * 2), 40.0f) ;
    _scrollView.contentSize = CGSizeMake(ScreenWidth, MarginOfChooseImageView * 2 + _imageView.height + MarginOfChooseImageView * 2 + _descLabel.height + MarginOfChooseImageView * 2 + _retryButton.height + MarginOfChooseImageView * 2);
}


- (void)setType:(ViewType)type
{
    _type = type;
    [self layoutSelfView];
}

@end
