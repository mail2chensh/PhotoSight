//
//  ENUMDefs.h
//  im309
//
//  Created by wuruijian on 14-11-24.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ENUMDefs : NSObject

// XJsonObject 请求数据的方式
typedef NS_ENUM(NSInteger, XJsonObjectAccessType) {
    XJsonObjectAccessType_Get = 0,
    XJsonObjectAccessType_Post = 1
};

///
typedef NS_ENUM(NSInteger, UserGenderType) {
    UserGenderType_Male = 1,
    UserGenderType_Female = 2
};

/////
//typedef NS_ENUM(NSInteger, UserInformationType) {
//    UserInformation_Name = 1,
//    UserInformation_Description,
//    UserInformation_Avatar,
//    UserInformation_AlbumCover,
//    UserInformation_RealName,
//    UserInformation_Gender,
//    UserInformation_Blood,
//    UserInformation_Birthday,
//    UserInformation_Company,
//    UserInformation_Job,
//    UserInformation_Address,
//    UserInformation_Email,
//    UserInformation_Phone,
//    UserInformation_QQ,
//    UserInformation_Weibo,
//    UserInformation_Wechat
//};

///
typedef NS_ENUM(NSInteger, ArticleType) {
    ArticleType_Text = 1,
    ArticleType_Image = 2,
    ArticleType_Video = 3,
    ArticleType_Music = 4
};

///
typedef NS_ENUM(NSInteger, XRefreshHeaderState) {
    XRefreshHeader_Normal = 0,
    XRefreshHeader_Pulling = 1,
    XRefreshHeader_Loading
};

///
typedef NS_ENUM(NSInteger, XLoginType) {
    XLoginType_Login = 1,
    XLoginType_Register = 2,
    XLoginType_ForgetPW = 3
};

///
typedef NS_ENUM(NSInteger, LoginInputType) {
    LoginInputType_Name = 1,
    LoginInputType_Password = 2
};

///
typedef NS_ENUM(NSInteger, LeftUCItemType) {
    LeftUCItemType_UserInfo = 1,
    LeftUCItemType_UserArt,
    LeftUCItemType_UserMessage
};

///
typedef NS_ENUM(NSInteger, SideSlipType) {
    SideSlipType_LeftVC = 1,
    SideSlipType_MainVC,
    SideSlipType_RightVC
};

@end
