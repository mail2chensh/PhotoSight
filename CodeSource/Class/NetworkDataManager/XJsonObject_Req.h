//
//  XJsonObject.h
//  im309
//
//  Created by wuruijian on 14-11-17.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ENUMDefs.h"

@interface XJsonObject_Req : NSObject

@property (nonatomic, strong) NSMutableDictionary *dataDict;

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, assign) XJsonObjectAccessType accessType;

- (id)initWithUrl:(NSURL*)url accessType:(XJsonObjectAccessType)accessType;

- (void)updateSetting;

@end
