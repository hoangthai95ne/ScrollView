//
//  ScrollViewBasic.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/8/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "ScrollViewBasic.h"

@interface ScrollViewBasic () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation ScrollViewBasic {
    UIImageView* photo;
    UILabel* label;
    UISlider* slider;
    UIToolbar* toolbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    slider = [[UISlider alloc] initWithFrame:CGRectMake(8, 0, self.view.bounds.size.width - 40, 20)];
    toolbar = [UIToolbar new];
    [toolbar sizeToFit];
    toolbar.frame = CGRectMake(0, statusNavigationBarHeight, self.view.bounds.size.width, 40);
    
    CGRect scrollRect = CGRectMake(0, toolbar.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - toolbar.frame.size.height);
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:scrollRect];
    self.scrollView.delegate = self;
    double minimumZoomScale = (double)375 / 2880;
    self.scrollView.minimumZoomScale = minimumZoomScale;
    self.scrollView.maximumZoomScale = 4.0;
    
    slider.minimumValue = self.scrollView.minimumZoomScale;
    slider.maximumValue = self.scrollView.maximumZoomScale;
    [slider addTarget:self
               action:@selector(onSliderChange:)
     forControlEvents:UIControlEventValueChanged];
    
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"superBigPhoto.jpg"]];
    
    [self.scrollView addSubview:photo];
    [self.view addSubview:self.scrollView];
    self.scrollView.zoomScale = 0.13;
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:slider];
    toolbar.items = @[barButton];
    [self.view addSubview:toolbar];
    
    label = [UILabel new];
    label.text = [NSString stringWithFormat:@"%2.2f", self.scrollView.zoomScale];
    label.frame = CGRectMake(0, 0, 50, 40);
    label.textAlignment = NSTextAlignmentRight;
    
    UIBarButtonItem* zoomScaleLabel = [[UIBarButtonItem alloc] initWithCustomView:label];
    self.navigationItem.rightBarButtonItem = zoomScaleLabel;
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return photo;
}

- (void) onSliderChange: (UISlider*)Slider {
    self.scrollView.zoomScale = Slider.value;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    label.text = [NSString stringWithFormat:@"%2.2f", self.scrollView.zoomScale];
    slider.value = self.scrollView.zoomScale;
}

@end
