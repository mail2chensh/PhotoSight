//
//  XJsonObject_Resp.m
//  im309
//
//  Created by wuruijian on 14-11-17.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import "XJsonObject_Resp.h"

@implementation XJsonObject_Resp

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self parseWithDictionary:dict];
    }
    return self;
}

- (void)parseWithDictionary:(NSDictionary*)rootDict
{
    
}

@end
