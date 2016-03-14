//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* UIViewAdvanced = @{SECTION: @"UIView Nâng cao", MENU: @[
                                             @{TITLE: @"Chuyển đổi Objective-C", CLASS: @"UIViewBasic"},
                                             @{TITLE: @"UIView Basic", CLASS: @"CampFire"},
                                             @{TITLE: @"Nested Square", CLASS: @"NestedSquare"},
                                             @{TITLE: @"Bird fly in jungle", CLASS: @"FlyingBird"},
                                             @{TITLE: @"Ship on the sea", CLASS: @"ShipAndSea"},
                                             @{TITLE: @"Stars field", CLASS: @"StarsField"},
                                             @{TITLE: @"RollingBall", CLASS: @"RollingBall"},
                                             @{TITLE: @"Earth around Sun", CLASS: @"EarthAroundSun"},
                                             @{TITLE: @"Drop Ball", CLASS: @"DropBall"},
                                             
                                             ]};
    NSDictionary* UIGestureRecognizer = @{SECTION: @"UIGestureRecognizer", MENU: @[
                                                  @{TITLE: @"Tap", CLASS: @"Tap"},
                                                  @{TITLE: @"Pan", CLASS: @"Pan"},
                                                  @{TITLE: @"Pinch and Rotate", CLASS: @"Pinch"},
                                                  ]};
    NSDictionary* ScrollView = @{SECTION: @"ScrollView", MENU: @[
                                         @{TITLE: @"ScrollView Basic", CLASS: @"ScrollViewBasic"},
                                         @{TITLE: @"ContentSize Basic", CLASS: @"ContentSize"},
                                         @{TITLE: @"Tap To Zoom", CLASS: @"TapToZoom"},
                                         @{TITLE: @"Pagging ScrollView", CLASS: @"PaggingScrollView"}
                                         ]};
    
    mainScreen.menu = @[ScrollView];
    mainScreen.title = @"Bootstrap App";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
