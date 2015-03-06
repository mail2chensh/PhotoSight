//
//  SendImageReq.m
//  PhotoSight
//
//  Created by chensh on 15-3-5.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "SendImageReq.h"

#define BOUNDARY_STRING @"AaB03x"

#define SendImageURL @"http://api.cloudsightapi.com/image_requests"


@implementation SendImageReq

- (id)init
{
    self = [super initWithUrl:[NSURL URLWithString:SendImageURL] accessType:XJsonObjectAccessType_Post];
    if (self) {
        
    }
    return self;
}

- (void)updateSetting
{
    self.dataDict = [[NSMutableDictionary alloc] init];
    
//    NSData *imageData = UIImagePNGRepresentation(self.image);
//    self.jsonString = [[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];

    
    
    //分界线 --AaB03x
    NSString *MPboundary = [[NSString alloc] initWithFormat:@"--%@",BOUNDARY_STRING];
    
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc] initWithFormat:@"%@--",MPboundary];

    //http body的字符串
    NSMutableString *body = [[NSMutableString alloc] init];
    
    // 非图片字段
    
    //添加分界线，换行
    [body appendFormat:@"%@\r\n", MPboundary];
    //添加字段名称，换2行
    [body appendFormat:@"Content-Disposition: form-data; name=\"image_request[locale]\"\r\n\r\n"];
    //添加字段的值
    [body appendFormat:@"zh-CN\r\n"];
    
//    //添加分界线，换行
//    [body appendFormat:@"%@\r\n", MPboundary];
//    //添加字段名称，换2行
//    [body appendFormat:@"Content-Disposition: form-data; name=\"image_request[language]\"\r\n\r\n"];
//    //添加字段的值
//    [body appendFormat:@"zh-CN\r\n"];
    

    //声明myRequestData，用来放入http body
    self.postData = [[NSMutableData alloc] init];
    
    //将body字符串转化为UTF8格式的二进制
    [_postData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 图片字段
    NSMutableString *imageHead = [[NSMutableString alloc] init];
    ////添加分界线，换行
    [imageHead appendFormat:@"\r\n%@\r\n", MPboundary];
    
    //声明pic字段，文件名为boris.png
//    [imageHead appendFormat:@"Content-Disposition: form-data; name=\"image[]\"; filename=\"ios_avatar.jpg\"\r\n"];
    [imageHead appendFormat:@"Content-Disposition: form-data; name=\"image_request[image]\"\r\n\r\n"];
    
    //
    [_postData appendData:[imageHead dataUsingEncoding:NSUTF8StringEncoding]];
    
    //
    NSData *imgData = UIImageJPEGRepresentation(_image, 1.0f);
    
    //
    [_postData appendData:imgData];
    
    //声明结束符：--AaB03x--
    NSString *end = [[NSString alloc] initWithFormat:@"\r\n%@", endMPboundary];
    
    //加入结束符--AaB03x--
    [_postData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
}



@end
