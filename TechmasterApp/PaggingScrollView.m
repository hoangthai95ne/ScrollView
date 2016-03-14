//
//  PaggingScrollView.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/11/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "PaggingScrollView.h"
#define PHOTO_WIDTH 320
#define PHOTO_HEIGHT 480
#define PHOTO_NUMBER 6

@interface PaggingScrollView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@end

@implementation PaggingScrollView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - PHOTO_WIDTH) / 2, 0, PHOTO_WIDTH, PHOTO_HEIGHT)];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(PHOTO_WIDTH * PHOTO_NUMBER, PHOTO_HEIGHT);
    self.scrollView.backgroundColor = [UIColor darkGrayColor];
    self.scrollView.pagingEnabled = YES;
    
    for (int i = 1; i <= PHOTO_NUMBER; i++) {
        UIImageView* photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i]]];
        photo.frame = CGRectMake((i - 1) * PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT);
        [self.scrollView addSubview:photo];
    }
    
    [self.view addSubview:self.scrollView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 64 - 40, self.view.bounds.size.width, 40)];
    self.pageControl.numberOfPages = PHOTO_NUMBER;
    self.pageControl.backgroundColor = [UIColor lightGrayColor];
    [self.pageControl addTarget:self
                         action:@selector(onPageControlChange:)
               forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.pageControl];
    
}

- (void) onPageControlChange: (id)sender {
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage * PHOTO_WIDTH, 0);
//    NSLog(@"%ld", (long)self.pageControl.currentPage);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.scrollView.contentOffset.x / PHOTO_WIDTH;
}


@end
