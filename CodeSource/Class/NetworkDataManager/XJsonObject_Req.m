//
//  XJsonObject.m
//  im309
//
//  Created by wuruijian on 14-11-17.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import "XJsonObject_Req.h"

@implementation XJsonObject_Req

- (id)initWithUrl:(NSURL*)url accessType:(XJsonObjectAccessType)accessType
{
    self = [super init];
    if (self) {
        _url = url;
        _accessType = accessType;
    }
    return self;
}

- (void)updateSetting
{
    
}



@end
