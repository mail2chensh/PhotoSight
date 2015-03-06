//
//  XHttpManager.h
//  im309
//
//  Created by wuruijian on 14-11-17.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XJsonObject_Req;

typedef void (^JSONOBJECT_BLOCK)(NSDictionary*, BOOL);


@interface XHttpManager : NSObject

+ (XHttpManager*)sendObject:(XJsonObject_Req*)object block:(JSONOBJECT_BLOCK)block;

- (void)post:(XJsonObject_Req*)object block:(JSONOBJECT_BLOCK)block;

- (void)get:(XJsonObject_Req*)object block:(JSONOBJECT_BLOCK)block;

+ (BOOL)parseFlagIsSuccess:(NSString *)flag;


@end
