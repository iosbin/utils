//
//  UIViewController+BackEvent.m
//  Cbox
//
//  Created by yinbing on 16/6/2.
//  Copyright © 2016年 yinbing. All rights reserved.
//

#import "UIViewController+BackEvent.h"

@implementation UIViewController (BackEvent)

- (void)backPreviousVC:(NSInteger)index
{
    
}

- (void)setNaviLeftImageWithName:(NSString *)imageName
{
    [self setLeftItemWithImageName:imageName];
}


- (void)setLeftItemWithImageName:(NSString *)imageName
{
    self.navigationItem.leftBarButtonItems=nil;
    if (!imageName.length) {
        return;
    }
    UIButton *leftBtn = [ResponseBuilder buttonNormalImage:imageName hightLightImage:imageName frame:CGRectMake(0, 0, 40, 30) target:self selector:@selector(navibarLeftBtnClick)];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItems = @[[self getSpaceItem:-16],leftBarItem];
}

- (void)setLeftItemWithTitle:(NSString *)title
{
    if (!title.length) {
        return;
    }
    self.navigationItem.leftBarButtonItems=nil;
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
#ifdef __IPHONE_11_0
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11")) {
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    }
#endif
    [backBtn setTitle:title forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(navibarLeftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    backBtn.titleLabel.font = [AppSkin appFontNormalSize];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItems = @[[self getSpaceItem:-16],leftBarItem];
}

- (void)navibarLeftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)getSpaceItem:(NSInteger)width
{
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = width;
    
    return spaceItem;
}

- (void)setNaviRrightImageWithView:(UIView *)view
{
    UIBarButtonItem * item=[[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItems = @[[self getSpaceItem:-16],item];
}

- (void)setNaviRrightImageWithView:(UIView *)view space:(NSInteger)space
{
    UIBarButtonItem * item=[[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItems = @[[self getSpaceItem:space],item];
}



@end
