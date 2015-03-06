//
//  SendImageReq.h
//  PhotoSight
//
//  Created by chensh on 15-3-5.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XJsonObject_Req.h"

@interface SendImageReq : XJsonObject_Req


@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSMutableData *postData;

@property (nonatomic, copy) NSString *jsonString;

@end
