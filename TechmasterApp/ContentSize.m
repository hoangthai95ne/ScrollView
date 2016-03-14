//
//  ContentSize.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/11/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "ContentSize.h"

@interface ContentSize () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;

@end

@implementation ContentSize {
    UIImageView* photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.scrollView.backgroundColor = [UIColor grayColor];
    
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"people.jpg"]];
    photo.frame = CGRectMake(0, 0, photo.bounds.size.width, photo.bounds.size.height);
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(8, (self.view.bounds.size.height - 64)/ 2 - photo.bounds.size.height / 2, self.view.bounds.size.width - 16, 300)];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = photo.bounds.size;
    self.scrollView.bounces = YES;
    
    [self.scrollView addSubview:photo];
    [self.view addSubview:self.scrollView];
}


@end
