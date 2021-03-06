//
//  XHttpManager.m
//  im309
//
//  Created by wuruijian on 14-11-17.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import "XHttpManager.h"
#import "ASIFormDataRequest.h"
#import "XJsonObject_Req.h"
#import "MacroDefs.h"
#import "URLManager.h"

#import "SendImageReq.h"
#define APIKey @"ol7umF43jePittu9IOXPOQ"


@interface XHttpManager () <ASIHTTPRequestDelegate>
{
    JSONOBJECT_BLOCK _block;
}
@end

@implementation XHttpManager

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (XHttpManager*)sendObject:(XJsonObject_Req *)object block:(JSONOBJECT_BLOCK)block
{
    XHttpManager *httpManager = [[XHttpManager alloc] init];
    if (object.accessType == XJsonObjectAccessType_Post) {
        [httpManager post:object block:block];
    } else {
        [httpManager get:object block:block];
    }
    return httpManager;
}

- (void)post:(XJsonObject_Req *)object block:(JSONOBJECT_BLOCK)block
{
    _block = block;
    [object updateSetting];
    
    ASIFormDataRequest *_formRequest = [[ASIFormDataRequest alloc] initWithURL:object.url];
    __weak ASIFormDataRequest *formRequest = _formRequest;
    
    // nsdata can't be blank
    // nsstring null
    //
    
    
    [formRequest addRequestHeader:@"Content-Type" value:@"multipart/form-data;boundary=AaB03x"];
//    [formRequest addRequestHeader:@"Content-Type" value:@"multipart/form-data"];
    [formRequest addRequestHeader:@"Authorization" value:[NSString stringWithFormat:@"CloudSight %@", APIKey]];
    [formRequest setPostBody:((SendImageReq*)object).postData];
    
//    [formRequest setPostValue:@"zh-CN" forKey:@"image_request[language]"];
//    [formRequest setPostValue:@"zh-CN" forKey:@"image_request[locale]"];
//    [formRequest setPostValue:((SendImageReq*)object).image  forKey:@"image_request[image]"];
    
    
    [formRequest setCompletionBlock:^{
        NSLog(@"responese :%@", [formRequest responseString]);
        
        NSData *responseData = [formRequest responseData];
        NSError *error = nil;
        NSDictionary *Dict = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
        if (error != nil) {
            NSLog(@"error:%@", [error localizedDescription]);
        }
        _block(Dict, YES);
    }];
    [formRequest setFailedBlock:^{
        NSError *error = [formRequest error];
        NSLog(@"resquet error: %@",[error userInfo]);
        _block(nil, NO);
    }];
    [formRequest startAsynchronous];
}

- (void)get:(XJsonObject_Req *)object block:(JSONOBJECT_BLOCK)block
{
    _block = block;
    [object updateSetting];
    ASIHTTPRequest *_request = [[ASIHTTPRequest alloc] initWithURL:object.url];
    __weak ASIHTTPRequest *request = _request;
    [request setCompletionBlock:^{
        NSData *responseData = [request responseData];
        NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
        if (error != nil) {
            NSLog(@"error:%@", [error localizedDescription]);
        }
        
        _block(dict, YES);
        
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        NSLog(@"resquet error: %@",[error userInfo]);
        _block(nil, NO);
    }];
    [request startAsynchronous];
}


+ (BOOL)parseFlagIsSuccess:(NSString *)flag
{
    if ([flag isEqualToString:RESPONSE_CONST_FLAG_ERROR]) {
        return NO;
    } else if ([flag isEqualToString:RESPONSE_CONST_FLAG_DATA]) {
        return YES;
    }
    return NO;
}


@end



