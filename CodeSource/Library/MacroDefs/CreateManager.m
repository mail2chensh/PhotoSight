//
//  CreateManager.m
//  im309
//
//  Created by wuruijian on 14-11-14.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import "CreateManager.h"
#import "MacroDefs.h"

@implementation CreateManager


+ (CGSize)calcContentSize:(NSString*)content TargetSize:(CGSize)tSize FontSize:(CGFloat)fontSize
{
    CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:tSize lineBreakMode:NSLineBreakByWordWrapping];
    return size;
}

+ (CGSize)calcContentHeight:(NSString*)content
{
    CGSize size = [CreateManager calcContentSize:content TargetSize:CGSizeMake(SquareCellWidth - 10.0f, 9999) FontSize:17.0f];
    return size;
}

+ (UIImageView*)createImageViewWithImageName:(NSString*)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width / 2, image.size.height / 2)];
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    return imageView;
}

+ (UIImageView*)createImageViewWithImageName:(NSString *)imageName StretchWidth:(float)width StretcgHeight:(float)height
{
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image stretchableImageWithLeftCapWidth:width topCapHeight:height];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width / 2, image.size.height / 2)];
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    return imageView;
}


+ (UIButton*)createButtonWithNormalName:(NSString*)normalName HighlightName:(NSString*)highlightName
{
    UIImage *image = [UIImage imageNamed:normalName];
    UIImage *highlightImage = [UIImage imageNamed:highlightName];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:highlightImage forState:UIControlStateSelected];
    button.frame = CGRectMake(0, 0, image.size.width / 2, image.size.height / 2);
    return button;
}

+ (UILabel*)createLabelWithText:(NSString*)text
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:14.0f];
//    label.numberOfLines = 0;
//    label.lineBreakMode = NSLineBreakByWordWrapping;
    [label sizeToFit];
    label.frame = CGRectMake(0, 0, label.frame.size.width, label.frame.size.height);
    return label;
}

+ (UIView*)createSeparatorView:(CGFloat)width
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 0.5)];
    view.backgroundColor = [UIColor colorWithRed:82.0f/255.0f green:85.0f/255.0f blue:98.0f/255.0f alpha:0.5];
    return view;
}

+ (UIBarButtonItem*)createBarButtonItem:(NSString*)imageName target:(id)target selector:(SEL)selector
{
    UIImageView *imageView = [CreateManager createImageViewWithImageName:imageName];
//    imageView.contentMode = UIViewContentModeCenter;
//    imageView.frame = CGRectMake(0, 0, 60.0f, 40.0f);
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:selector]];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 80.0f, 50.0f);
//    button.imageView.contentMode = UIViewContentModeCenter;
//    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    
    return item;
}

+ (UIBarButtonItem*)createBarButtonItemWithTitle:(NSString*)title target:(id)target selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100.0f, 40.0f);
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}


+ (UIImage *)image:(UIImage*)image scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
