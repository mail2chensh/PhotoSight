//
//  MainViewController.m
//  PhotoSight
//
//  Created by chensh on 15-3-5.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "MainViewController.h"
#import "MainRootView.h"
#import "CreateManager.h"

#import "XHttpManager.h"
#import "SendImageReq.h"

@interface MainViewController () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    MainRootView *_rootView;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _rootView = [[MainRootView alloc] initWithFrame:self.view.frame];
    [_rootView.addButton addTarget:self action:@selector(addButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
    [_rootView.retryButton addTarget:self action:@selector(retryButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
    self.view = _rootView;
    
}

#pragma mark - button event
- (void)addButtonDidTouch:(id)sender
{
    UIActionSheet *myActionSheet = [[UIActionSheet alloc]
                                    initWithTitle:nil
                                    delegate:self
                                    cancelButtonTitle:@"取消"
                                    destructiveButtonTitle:nil
                                    otherButtonTitles: @"拍照", @"相册",nil];
    
    [myActionSheet showInView:self.view];
}

- (void)retryButtonDidTouch:(id)sender
{
    _rootView.type = ViewType_Add;
}


#pragma mark -

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self collectPhotoWithCamera];
            break;
        case 1:
            [self collectPhotoWithAlbum];
        default:
            break;
    }
}

- (void)collectPhotoWithCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    } else {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

- (void)collectPhotoWithAlbum
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *originImage = [info objectForKey:UIImagePickerControllerEditedImage];
        // scale image
        
        [picker dismissViewControllerAnimated:YES completion:^{
            
            _rootView.imageView.image = originImage;
            _rootView.type = ViewType_Show;
            
            [self sendImage:originImage];
            
        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - send image
- (void)sendImage:(UIImage*)image
{
    UIImage *tempImage = [CreateManager image:image scaleToSize:CGSizeMake(150, 150)];
    
    SendImageReq *req = [[SendImageReq alloc] init];
    req.image = tempImage;
    [XHttpManager sendObject:req block:^(NSDictionary *dict, BOOL conSuc) {
        if (!conSuc) {
            NSLog(@"connection fail");
        }
        
    }];
}


@end
