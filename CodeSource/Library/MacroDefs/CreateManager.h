//
//  CreateManager.h
//  im309
//
//  Created by wuruijian on 14-11-14.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateManager : NSObject

+ (CGSize)calcContentSize:(NSString*)content TargetSize:(CGSize)tSize FontSize:(CGFloat)fontSize;

+ (CGSize)calcContentHeight:(NSString*)content;

+ (UIImageView*)createImageViewWithImageName:(NSString*)imageName;

+ (UIImageView*)createImageViewWithImageName:(NSString *)imageName StretchWidth:(float)width StretcgHeight:(float)height;

+ (UIButton*)createButtonWithNormalName:(NSString*)normalName HighlightName:(NSString*)highlightName;

+ (UILabel*)createLabelWithText:(NSString*)text;

+ (UIView*)createSeparatorView:(CGFloat)width;

+ (UIBarButtonItem*)createBarButtonItem:(NSString*)imageName target:(id)target selector:(SEL)selector;

+ (UIBarButtonItem*)createBarButtonItemWithTitle:(NSString*)title target:(id)target selector:(SEL)selector;

+ (UIImage *)image:(UIImage*)image scaleToSize:(CGSize)size;



@end
