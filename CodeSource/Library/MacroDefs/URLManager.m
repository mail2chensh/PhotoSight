//
//  URLManager.m
//  im309
//
//  Created by wuruijian on 14-11-17.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import "URLManager.h"

#define URL_DoMain @"http://309.im"
#define URL_Home @"Home"

#define URL_ArticleList @"art-list"
#define URL_ArticleDetail @"art"
#define URL_ArticlePublic @"art-pub"
#define URL_ArticleMediaUp @"media-up"

#define URL_ResponJson @"respon/json"

#define URL_NameCheck @"name-check"
#define URL_Register @"register"
#define URL_Login @"login"
#define URL_UinfoView @"uinfo-view"
#define URL_UinfoEdit @"uinfo-edit"
#define URL_AvatarUp @"avatar-up"


@implementation URLManager

///
+ (NSURL*)urlOfAddrString:(NSString*)addrStr
{
    return [NSURL URLWithString:addrStr];
}

///
+ (NSString*)spliceAddrString:(NSArray *)arr
{
    NSString *newStr = arr[0];
    NSUInteger count = arr.count;
    for (int i = 1; i < count; i++) {
        newStr = [NSString stringWithFormat:@"%@/%@", newStr, arr[i]];
    }
    return newStr;
}

/// 拼接参数
+ (NSString *)spliceParam:(NSDictionary*)dict
{
    if (dict == nil || dict.allKeys.count == 0) return @"";
    NSString *query = @"?";
    NSArray *keys = dict.allKeys;
    for (int i = 0; i < keys.count; i++) {
        NSString *value = [dict objectForKey:keys[i]];
        query = [NSString stringWithFormat:@"%@%@%@=%@",query, (i == 0)?@"":@"&", keys[i], value];
    }
    return query;
}

+ (NSURL *)spliceAddrWithParam:(NSURL*)baseUrl ParamDict:(NSDictionary*)dict
{
    baseUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[baseUrl absoluteString], [URLManager spliceParam:dict]]];
    return baseUrl;
}

+ (NSString *)encodeString:(NSString*)str
{
    NSString *enStr = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)str, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    return enStr;
}

///
+ (NSString*)serverURL
{
    return [URLManager spliceAddrString:@[URL_DoMain, URL_Home]];
}

///
+ (NSURL*)imageUrl:(NSString*)str
{
    return [URLManager urlOfAddrString:[NSString stringWithFormat:@"%@%@", URL_DoMain, str]];
}

///
+ (NSURL*)articleList
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_ArticleList, URL_ResponJson]]];
}

///
+ (NSURL*)articleDetail
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_ArticleDetail, URL_ResponJson]]];
}

///
+ (NSURL*)articlePublic
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_ArticlePublic]]];
}

///
+ (NSURL*)articleMeidaUp
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_ArticleMediaUp]]];
}

///
+ (NSURL*)loginNameCheck
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_ArticleMediaUp]]];
}

///
+ (NSURL*)registerUser
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_Register]]];
}

///
+ (NSURL*)login
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_Login]]];
}

///
+ (NSURL*)userInfoView
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_UinfoView]]];
}

///
+ (NSURL*)userInfoEdit
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_UinfoEdit]]];
}

///
+ (NSURL*)userAvatarUp
{
    return [URLManager urlOfAddrString:[URLManager spliceAddrString:@[[URLManager serverURL], URL_AvatarUp]]];
}


@end
