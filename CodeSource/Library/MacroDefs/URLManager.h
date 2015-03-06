//
//  URLManager.h
//  im309
//
//  Created by wuruijian on 14-11-17.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BOUNDARY_STRING @"AaB03x"

@interface URLManager : NSObject

+ (NSString *)encodeString:(NSString*)str;

+ (NSURL *)spliceAddrWithParam:(NSURL*)baseUrl ParamDict:(NSDictionary*)dict;

+ (NSString *)serverURL;

+ (NSURL*)imageUrl:(NSString*)str;

+ (NSURL*)articleList;

+ (NSURL*)articleDetail;

+ (NSURL*)articlePublic;

+ (NSURL*)articleMeidaUp;

+ (NSURL*)loginNameCheck;

+ (NSURL*)registerUser;

+ (NSURL*)login;

///
+ (NSURL*)userInfoView;

///
+ (NSURL*)userInfoEdit;

///
+ (NSURL*)userAvatarUp;

@end
