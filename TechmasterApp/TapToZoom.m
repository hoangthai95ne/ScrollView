//
//  TapToZoom.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/11/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "TapToZoom.h"
#define ZOOMSTEP 1.6

@interface TapToZoom () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIImageView* photo;

@end

@implementation TapToZoom {
    UILabel* labelScale;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.scrollView.delegate = self;
    self.scrollView.clipsToBounds = YES;
    self.scrollView.minimumZoomScale = 0.13;
    self.scrollView.maximumZoomScale = 10.0;
    
    self.photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"superBigPhoto.jpg"]];
    self.photo.userInteractionEnabled = YES;
    self.photo.multipleTouchEnabled = YES;
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                                 action:@selector(singleTap:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.delegate = self;
    UITapGestureRecognizer* doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(doubleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    doubleTapGesture.delegate = self;
    
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    [self.photo addGestureRecognizer:tapGesture];
    [self.photo addGestureRecognizer:doubleTapGesture];
    
    [self.scrollView addSubview:self.photo];
    self.scrollView.zoomScale = self.scrollView.minimumZoomScale;
    
    labelScale = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    labelScale.textAlignment = NSTextAlignmentRight;
    labelScale.text = [NSString stringWithFormat:@"%2.2f", self.scrollView.zoomScale];
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:labelScale];
    self.navigationItem.rightBarButtonItem = barButton;
    
    [self.view addSubview:self.scrollView];
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.photo;
}

- (void) zoomRectForScale: (CGFloat)scale 
                 atCenter: (CGPoint)center {
    
    CGRect zoomRect;
    CGSize scrollViewSize = self.scrollView.bounds.size;
    
    zoomRect.size.width = scrollViewSize.width / scale;
    zoomRect.size.height = scrollViewSize.height / scale;
    
    zoomRect.origin.x = center.x - zoomRect.size.width / 2;
    zoomRect.origin.y = center.y - zoomRect.size.height / 2;
    
    [self.scrollView zoomToRect:zoomRect
                       animated:YES];
    
    labelScale.text = [NSString stringWithFormat:@"%2.2f", self.scrollView.zoomScale];
}

- (void) singleTap: (UITapGestureRecognizer*) tap {
    CGFloat newScale = self.scrollView.zoomScale * ZOOMSTEP;
    [self zoomRectForScale:newScale
                  atCenter:[tap locationInView:self.photo]];
}

- (void) doubleTap: (UITapGestureRecognizer*) tap {
    CGFloat newScale = self.scrollView.zoomScale / ZOOMSTEP;
    [self zoomRectForScale:newScale
                  atCenter:[tap locationInView:self.photo]];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
}



@end
